import ipaddress

class IPChecker():
    def __init__(self):
        self.in_range = False
        self.error_msg = ''

    # Properties
    def _get_is_within(self):
        return self.in_range
    
    def _get_error_msg(self):
        return self.error_msg
    
    is_in_range = property(
        fget = _get_is_within
    )

    error = property(
        fget = _get_error_msg
    )

    def check_ip_range(self, ips, ip_range):
        '''
            Check if some IP within 'ips', is in 'ip_range' list\n
            'ip_range' elements can be:
            - single IP
            - range in the format of '<start IP>-<end IP>
            - network address like x.x.x.x/y
        '''
        try:
            found = False
            # Loop through each IP
            for ip in ips:
                ip = ipaddress.IPv4Address(ip)
                # Loop through each range
                for range in ip_range:
                    # range format xxxx-xxxx
                    # if ('-' in range):
                    #     tmp_ips = range.split('-')
                    #     start_ip = ipaddress.IPv4Address(tmp_ips[0])
                    #     end_ip = ipaddress.IPv4Address(tmp_ips[1])
                    #     if (start_ip <= ip <= end_ip):
                    #         found = True
                    #         break   
                    # if ('/' in range):
                    #     tmp_ips = ipaddress.ip_network(range)
                    #     if (ip in tmp_ips):
                    #         found = True
                    #         break 
                    # Single IP
                    if ((not '-' in range) and (not '/' in range)): 
                        tmp_ip =  ipaddress.IPv4Address(range)
                        if (ip == tmp_ip):
                            found = True
                            break
                    if (found):
                        break
                if (found):
                    break
            self.in_range = found
            self.error_msg = ''

        except Exception as ex:
            self.error_msg = 'Error checking IP {}: {}'.format(ip, ex)
    
    def convert_range(self, ip_range):
        try:
            ip_list = []
            if ('-' in ip_range):
                ip_range = ip_range.split('-')
                start_ip = ipaddress.IPv4Address(ip_range[0])
                end_ip = ipaddress.IPv4Address(ip_range[1])
                for ip_int in range(int(start_ip), int(end_ip)+1):
                    ip_list.append(format(ipaddress.IPv4Address(ip_int)))
            if ('/' in ip_range):
                ip_range = ipaddress.ip_network(ip_range)
                for ip_address in ip_range:
                    ip_list.append(str(ip_address))
            result = {
                'error': False,
                'data': ip_list
            }
        except Exception as ex:
            result = {
                'error': True,
                'data' : 'Error converting IP range {}: {}'.format(ip_range, ex)
            }
        return result
    
    def consolidate_ip_list(self, ip_list):
        try:
            unique_list = []
            for ip in ip_list:
                if (('-' in ip) or ('/' in ip)):
                    result = self.convert_range(ip)
                    if (result['error']):
                        result['data'] = 'Error consolidating IP list -> {}'.format(result['data'])
                        return result
                    else:
                        unique_list.extend(result['data'])
                else:
                    unique_list.extend(ip)
            result = {
                    'error': False,
                    'data': list(set(unique_list))
                }
        except Exception as ex:
            result = {
                'error': True,
                'data' : 'Error consolidating IP list {}: {}'.format(ip_list, ex)
            }
        return result
