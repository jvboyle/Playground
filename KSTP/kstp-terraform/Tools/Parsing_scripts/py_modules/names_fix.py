# This module was created as there is a need to apply the same logic to fix the names
# for different elements in different scripts. This module will be imported in those.

import re

###############################################################################################
def fix_name(name):
    # name = name.replace('–', '-').replace(' ', '-').replace('.', '-').replace('/','-').replace('(','-').replace(')','-').replace('--','-').strip()

    # r: The r before the opening quote signifies that this is a raw string, we can use backslashes and other special characters without needing to escape them.
    # []: The square brackets are used to define a character set, which matches any one character that appears inside the brackets.
    # ^: The caret character at the beginning of the character set means that we want to match any character that is NOT in the set.
    # \w: The \w matches any word character, which includes letters, digits, and underscores.
    # +: The plus sign at the end of the character set means that we want to match one or more occurrences of the preceding pattern.
    pattern = r'[^\w-]+'
    name = re.sub(pattern, '-', name)
    # After the first run, we can end up with multiple hyphens in a row, we run it again to remove that
    # -+: 2 or more hyphen characters in a row.
    pattern = r'-+'
    name = re.sub(pattern, '-', name)
    return name

###############################################################################################
def tf_prefix(geography, elem, type):
    '''
        This function will create and append the prefix TF_<GEO>-HOST- for those
        elements that does not have it
        - item: single element
        - type: 'IPSET' or 'SG'
    '''

    geo = '{}-'.format(geography)
    try:
        if (not isinstance(elem, list)):
            elem = fix_name(elem)
            if (type == 'SG'):
                elem = elem.replace(geo.lower(),'').replace(geo.upper(),'')
                elem = 'TF-{}-{}'.format(geography, elem)
            if (type == 'VM'):
                new_elem = elem.replace(geo.lower(),'').replace(geo.upper(),'')
                new_elem = new_elem.replace('host-','').replace('HOST-','')
                elem = 'TF-{}-HOST-{}'.format(geography, new_elem)
            if (type == 'IPSET'):
                new_elem = elem.replace(geo.lower(),'').replace(geo.upper(),'')
                new_elem = new_elem.replace('host-','').replace('HOST-','')
                elem = 'TF-{}-IPSET-{}'.format(geography, new_elem)
            updated_item = elem
        else:
            updated_item = []
            for item in elem:
                item = fix_name(item)
                if (type == 'SG'):
                    item = item.replace(geo.lower(),'').replace(geo.upper(),'')
                    item = 'TF-{}-{}'.format(geography, item)
                if (type == 'VM'):
                    new_elem = item.replace(geo.lower(),'').replace(geo.upper(),'')
                    new_elem = new_elem.replace('host-','').replace('HOST-','')
                    item = 'TF-{}-HOST-{}'.format(geography, new_elem)
                if (type == 'IPSET'):
                    new_elem = item.replace(geo.lower(),'').replace(geo.upper(),'')
                    new_elem = new_elem.replace('host-','').replace('HOST-','')
                    item = 'TF-{}-IPSET-{}'.format(geography, new_elem)
                updated_item.append(item)
        return {
            'error': False,
            'data': updated_item
        }
    
    except Exception as ex:
        return {
            'error': True,
            'data': 'TF prefix -> {}'.format(ex)
        }
