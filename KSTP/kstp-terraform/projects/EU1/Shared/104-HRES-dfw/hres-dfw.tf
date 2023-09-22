resource "nsxt_policy_security_policy" "policies_TF-HRES-json_2_tf" {
  display_name    = "TF-HRES"
  category        = "Application"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-HRES"
  comments        = ""
  sequence_number = 0
  rule {
    display_name = "TF-6003-HRES-LB-to-CAR"
    notes        = "SR50876819"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcarwas1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcarwas1000",
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3702-LB-to-SSH-Proxy-nodes"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-FSSProd"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod",
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-FSSProd"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3703-WIN-Jump-&-EU-AT-to-HRES-SSH-Proxy-for-EU-Shared-&-FSS-Prod-Instance"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster03"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2ssh-VIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-FSSProd",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta1ssh-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2ssh-VIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-FSSProd",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta1ssh-VIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3704-SSH-Proxy-EU-Shared-nodes-to-DA-EU-Shared"
    notes        = "SR50927643"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SCU-srv-dna-02-100-79-236-59",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-PA1AVLBINA1-100-79-236-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdibmcc02-100-79-236-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-ucetems01-100-79-236-15",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GNF-pvlipsoft2-100-79-236-71",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Spain-EUS-1-es01qih01sr01rm-129-39-41-40",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-2-Jump1pol-195-118-230-207",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-bpbansiblejh-01-100-79-236-105",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IB1-VISR5LIEM-02-158-98-139-119",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-STG-dkccqap05sr04rm-158-98-140-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-3-jump2sha-195-118-230-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IPC-prodnljh01-146-89-167-215",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Portugal-EUS-2-pt012ap04sr01rm-158-98-74-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860002-100-79-236-65",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BIC-psralibmjh01-100-79-236-79",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IPC-prodnljh02-146-89-167-216",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPAKCNHL-159-61-70-31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LMZ01PJMP0002-100-79-236-47",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IST-TRSO-158-98-136-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WSS-it06qih010wssrm-129-39-135-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVM-lvpapdynautmx02-150-100-195-164",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BV3-lpjum001-100-79-236-13",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DKI-NOEP65LSSH-01-195-200-201-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AP5-ibmpsoboxap51-100-79-236-60",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HEN-henpsobox2-158-98-224-21",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-flumgt01-100-79-236-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-RAV-VIE43DYN-01-100-79-236-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IT2-vielogin2-129-39-157-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPAJCNHL-159-61-70-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-FR2AVLBINA3-100-79-236-121",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxei1-129-39-159-12",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-sescqap01sr05rm-129-39-150-12",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PAS-ibmpsoboxpas2-194-194-203-245",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LMZ01PJMP0001-100-79-236-46",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Spain-EUS-2-es06qih01sr01rm-129-39-41-41",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVM-lvpapdynautmx01-150-100-195-163",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ACO-atllx008-100-79-236-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-FMS-fmspsobox2-158-98-146-197",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-4-ibmpsoboxfs2-158-98-144-47",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-5-it06pih00dr02rm-158-98-138-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-ucetems02-100-79-236-16",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IDK-dkccqap01ir12rm-158-98-71-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap01sr18rm-158-98-141-23",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SEI-sesc2ih03ir04rm-158-98-129-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VISR2LCACF-01-62-185-95-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ICO-es06qih02ir01rm-129-39-41-6",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-EDI-frneram00cp00rm-129-39-135-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BV3-lpjum002-100-79-236-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CTT-lxpjmp01-100-79-236-21",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DKI-MAEP65LSSH-01-195-200-201-243",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVP-lppbfx302-100-79-236-20",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-MPF-LES000A106290-100-79-236-74",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-sescqap02sr05rm-129-39-150-13",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VIDR16LJUMP-01-195-118-243-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ICO-es01qih02ir01rm-129-39-41-5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CTT-lxpjmp02-100-79-236-22",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LXLN2PJMP0002-100-79-236-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GH2-ibmpsoboxgh22-100-79-236-63",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-flumgt21-100-79-236-104",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVP-lppbfx301-100-79-236-19",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-NCIMBCPAUTH01-100-79-236-24",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PAS-ibmpsoboxpas1-194-194-203-244",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PTG-PT012SI01IR01RM-158-98-137-251",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SAI-sto00-lx157-194-69-35-60",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BIC-psralibmjh01-100-79-236-78",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LKED0PJMP0002-100-79-236-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdjmp01-100-79-236-76",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD10018E0007-100-79-236-67",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-MPF-LES000A206187-100-79-236-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP01-158-98-132-88",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap06sr04rm-158-98-140-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxei2-129-39-159-13",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LXLN2PJMP0001-100-79-236-48",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-lxjmpap2-100-79-236-26",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP02-158-98-132-89"  
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SCU-srv-dna-02-100-79-236-59",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-PA1AVLBINA1-100-79-236-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdibmcc02-100-79-236-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-ucetems01-100-79-236-15",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GNF-pvlipsoft2-100-79-236-71",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Spain-EUS-1-es01qih01sr01rm-129-39-41-40",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-2-Jump1pol-195-118-230-207",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-bpbansiblejh-01-100-79-236-105",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IB1-VISR5LIEM-02-158-98-139-119",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-STG-dkccqap05sr04rm-158-98-140-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-3-jump2sha-195-118-230-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IPC-prodnljh01-146-89-167-215",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Portugal-EUS-2-pt012ap04sr01rm-158-98-74-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860002-100-79-236-65",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BIC-psralibmjh01-100-79-236-79",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IPC-prodnljh02-146-89-167-216",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPAKCNHL-159-61-70-31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LMZ01PJMP0002-100-79-236-47",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IST-TRSO-158-98-136-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WSS-it06qih010wssrm-129-39-135-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVM-lvpapdynautmx02-150-100-195-164",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BV3-lpjum001-100-79-236-13",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DKI-NOEP65LSSH-01-195-200-201-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AP5-ibmpsoboxap51-100-79-236-60",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HEN-henpsobox2-158-98-224-21",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-flumgt01-100-79-236-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-RAV-VIE43DYN-01-100-79-236-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IT2-vielogin2-129-39-157-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPAJCNHL-159-61-70-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-FR2AVLBINA3-100-79-236-121",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxei1-129-39-159-12",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-sescqap01sr05rm-129-39-150-12",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PAS-ibmpsoboxpas2-194-194-203-245",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LMZ01PJMP0001-100-79-236-46",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Spain-EUS-2-es06qih01sr01rm-129-39-41-41",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVM-lvpapdynautmx01-150-100-195-163",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ACO-atllx008-100-79-236-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-FMS-fmspsobox2-158-98-146-197",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-4-ibmpsoboxfs2-158-98-144-47",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-5-it06pih00dr02rm-158-98-138-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-ucetems02-100-79-236-16",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IDK-dkccqap01ir12rm-158-98-71-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap01sr18rm-158-98-141-23",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SEI-sesc2ih03ir04rm-158-98-129-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VISR2LCACF-01-62-185-95-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ICO-es06qih02ir01rm-129-39-41-6",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-EDI-frneram00cp00rm-129-39-135-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BV3-lpjum002-100-79-236-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CTT-lxpjmp01-100-79-236-21",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DKI-MAEP65LSSH-01-195-200-201-243",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVP-lppbfx302-100-79-236-20",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-MPF-LES000A106290-100-79-236-74",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-sescqap02sr05rm-129-39-150-13",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VIDR16LJUMP-01-195-118-243-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ICO-es01qih02ir01rm-129-39-41-5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CTT-lxpjmp02-100-79-236-22",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LXLN2PJMP0002-100-79-236-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GH2-ibmpsoboxgh22-100-79-236-63",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-flumgt21-100-79-236-104",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BVP-lppbfx301-100-79-236-19",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-NCIMBCPAUTH01-100-79-236-24",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PAS-ibmpsoboxpas1-194-194-203-244",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PTG-PT012SI01IR01RM-158-98-137-251",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SAI-sto00-lx157-194-69-35-60",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BIC-psralibmjh01-100-79-236-78",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LKED0PJMP0002-100-79-236-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdjmp01-100-79-236-76",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD10018E0007-100-79-236-67",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-MPF-LES000A206187-100-79-236-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP01-158-98-132-88",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap06sr04rm-158-98-140-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxei2-129-39-159-13",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LXLN2PJMP0001-100-79-236-48",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-lxjmpap2-100-79-236-26",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP02-158-98-132-89",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3876-WIN-Jump-&-JP-AT-to-HRES-SSH-Proxy-for-JP-Shared-Instance"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta3ssh-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta3ssh-VIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3880-SSH-Proxy-EU-FSS-nodes-to-DA-EU-FSS"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-FSSProd"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-KBZAJMPBX01-100-79-236-86",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC003-158-98-232-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFG-JumpHost2-212-63-226-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-KBBIJMPBX01-100-79-236-87",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2W-ilp-j024-146-192-227-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2M-ilp-j027-146-192-227-171",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-ilp-j151-100-79-236-51",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC001-84-255-94-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2E-ilp-j122-146-192-227-24",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC005-158-98-232-77",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LHT-ibmpsoboxlht2-146-89-188-168",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2E-ilp-j121-146-192-227-23",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-EFS-ibmpsoboxefs2-100-79-236-69",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2M-ilp-j124-146-192-227-176",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LHT-ibmpsoboxlht1-146-89-188-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC002-84-255-94-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-O2E-ilp-j131-146-192-227-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-EFS-ibmpsoboxefs1-100-79-236-68",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2S-ilp-j126-146-192-227-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2W-ilp-j023-146-192-227-81",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2M-ilp-j028-146-192-227-172",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC006-158-98-232-78",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2W-ilp-j128-146-192-227-86",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC004-158-98-232-76",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2M-ilp-j123-146-192-227-175",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-O2E-ilp-j132-146-192-227-31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2E-ilp-j022-146-192-227-22",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFG-JumpHost1-212-63-226-239",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-ilp-j150-100-79-236-50",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2W-ilp-j127-146-192-227-85",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2E-ilp-j021-146-192-227-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2S-ilp-j125-146-192-227-145"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-KBZAJMPBX01-100-79-236-86",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-FSSProd",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-KBBIJMPBX01-100-79-236-87",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFG-JumpHost2-212-63-226-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC003-158-98-232-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2W-ilp-j024-146-192-227-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2M-ilp-j027-146-192-227-171",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-ilp-j151-100-79-236-51",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC001-84-255-94-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2E-ilp-j122-146-192-227-24",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC005-158-98-232-77",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LHT-ibmpsoboxlht2-146-89-188-168",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2E-ilp-j121-146-192-227-23",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-EFS-ibmpsoboxefs2-100-79-236-69",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2S-ilp-j125-146-192-227-145",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2M-ilp-j124-146-192-227-176",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LHT-ibmpsoboxlht1-146-89-188-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC002-84-255-94-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-O2E-ilp-j131-146-192-227-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-EFS-ibmpsoboxefs1-100-79-236-68",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2S-ilp-j126-146-192-227-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2W-ilp-j023-146-192-227-81",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2M-ilp-j028-146-192-227-172",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC006-158-98-232-78",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2W-ilp-j128-146-192-227-86",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-KMDLNXIPC004-158-98-232-76",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2M-ilp-j123-146-192-227-175",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-O2E-ilp-j132-146-192-227-31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2E-ilp-j022-146-192-227-22",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFG-JumpHost1-212-63-226-239",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-FSS-ilp-j150-100-79-236-50",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-N2E-ilp-j021-146-192-227-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-F2W-ilp-j127-146-192-227-85"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3881-SSH-Proxy-JP-Shared-nodes-to-DA-JP"
    notes        = "SR50884065 SR50934669 SR50966140 SR50966142 SR51038895 SR51098084 SR51135104 SR51243810 SR51309582 SR51365702 SR51428693 RITM0074632 RITM0114423 RITM0118346 RITM0121146 RITM0126093 RITM0135034"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVDDDAL1-158-98-20-218",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1ht-100-79-236-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH01-158-98-21-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ1-100-87-130-52",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVPPDAL1-100-79-236-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01t-158-98-21-104",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS000ASLR4-158-98-248-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmnc1-129-39-125-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDY00001-158-98-251-246",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SKO-mtkrhel01-158-98-24-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpdev1-158-98-23-226",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XBX-jp01dsl01drslr4-158-87-222-209",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-79-236-29",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-158-98-24-203",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-s1lxta02-158-98-20-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2hc-100-79-236-116",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tmaajh01-100-79-236-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp31k-100-79-236-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJTAKSV923-100-87-162-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0081-158-98-99-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP08QIH000ASLR4-158-98-99-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-140",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021rb-158-98-104-91",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZNR-S00X2269-158-98-99-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jpb41k-100-79-236-90",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS020ASLR4-158-98-248-181",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht2-158-98-21-215",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0083-158-98-99-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-OCS-cstpm050-158-98-251-15",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01-158-98-21-8",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-79-236-34",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FBK-pmwvjh01-129-39-115-131",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVOSDAL1-100-79-236-28",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH002-158-98-248-239",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp2-158-98-21-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2hc-100-79-236-112",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AEO-ae3jph02-158-98-248-79",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FUH-mslxdat1-100-79-236-41",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod02-158-98-23-202",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh02-100-79-236-135",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ2-100-87-130-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl02-158-98-22-18",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-100-79-236-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTB-ucpjum01-100-79-236-35",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-139",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJDR4SG1-158-98-104-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump02-158-98-21-74",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AFL-pzzljb01-130-103-183-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH02-100-79-236-39",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MJI-PSUIN261-158-98-104-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YKK-IBMJMP01-158-98-24-93",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmngwsb1-158-98-24-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod01-158-98-23-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MRT-m0iainfra01-100-79-236-40",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-d3lxta01-158-98-20-142",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01-158-98-21-69",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2kt-100-79-236-118",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AFL-pzzljb02-130-103-183-104",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-150",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KYB-aaps127-158-98-248-214",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ta-100-79-236-108",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1kt-100-79-236-117",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH-PROD-158-98-21-124",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-155",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVOSDAL1-158-98-20-222",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1hc-100-79-236-111",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH04-100-79-236-148",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01-158-98-21-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-79-236-133",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-RCJ-DAPRIP02-158-98-101-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-141",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-158-98-99-219",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-OMR-sgdgw13-129-39-115-206",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp31t-100-79-236-31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NHG-MAJMPHST01SV-158-98-20-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS000ASLR4-158-98-248-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS030ASLR4-158-98-99-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump1-158-98-251-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KAO-s01az03p65-158-98-104-136",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-OMR-sgdgw3-129-39-115-205",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp2-158-98-23-194",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ta-158-98-104-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDY00002-158-98-251-247",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0021-158-98-99-116",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump02-158-98-21-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp1-158-98-21-211",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0086-100-79-236-88",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mktmsjht1-158-98-21-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXE1231E-100-79-236-94",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH001-158-98-248-238",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump02-158-98-21-9",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh02-100-79-236-97",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AEO-ae3jph01-158-98-248-78",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-160",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-156"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVDDDAL1-158-98-20-218",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1ht-100-79-236-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH01-158-98-21-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ1-100-87-130-52",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVPPDAL1-100-79-236-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01t-158-98-21-104",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS000ASLR4-158-98-248-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmnc1-129-39-125-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDY00001-158-98-251-246",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SKO-mtkrhel01-158-98-24-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpdev1-158-98-23-226",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XBX-jp01dsl01drslr4-158-87-222-209",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-79-236-29",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-158-98-24-203",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-s1lxta02-158-98-20-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2hc-100-79-236-116",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tmaajh01-100-79-236-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp31k-100-79-236-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJTAKSV923-100-87-162-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0081-158-98-99-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP08QIH000ASLR4-158-98-99-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-140",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021rb-158-98-104-91",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZNR-S00X2269-158-98-99-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jpb41k-100-79-236-90",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS020ASLR4-158-98-248-181",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht2-158-98-21-215",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0083-158-98-99-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-OCS-cstpm050-158-98-251-15",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01-158-98-21-8",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-79-236-34",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FBK-pmwvjh01-129-39-115-131",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVOSDAL1-100-79-236-28",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH002-158-98-248-239",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp2-158-98-21-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2hc-100-79-236-112",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AEO-ae3jph02-158-98-248-79",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FUH-mslxdat1-100-79-236-41",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod02-158-98-23-202",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh02-100-79-236-135",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ2-100-87-130-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl02-158-98-22-18",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-100-79-236-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTB-ucpjum01-100-79-236-35",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-139",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJDR4SG1-158-98-104-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump02-158-98-21-74",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AFL-pzzljb01-130-103-183-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH02-100-79-236-39",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MJI-PSUIN261-158-98-104-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YKK-IBMJMP01-158-98-24-93",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmngwsb1-158-98-24-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod01-158-98-23-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MRT-m0iainfra01-100-79-236-40",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-d3lxta01-158-98-20-142",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01-158-98-21-69",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2kt-100-79-236-118",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AFL-pzzljb02-130-103-183-104",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-150",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KYB-aaps127-158-98-248-214",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ta-100-79-236-108",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1kt-100-79-236-117",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH-PROD-158-98-21-124",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-155",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVOSDAL1-158-98-20-222",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1hc-100-79-236-111",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH04-100-79-236-148",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01-158-98-21-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-79-236-133",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-RCJ-DAPRIP02-158-98-101-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-141",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-158-98-99-219",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-OMR-sgdgw13-129-39-115-206",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp31t-100-79-236-31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NHG-MAJMPHST01SV-158-98-20-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS000ASLR4-158-98-248-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS030ASLR4-158-98-99-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump1-158-98-251-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KAO-s01az03p65-158-98-104-136",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-OMR-sgdgw3-129-39-115-205",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp2-158-98-23-194",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ta-158-98-104-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDY00002-158-98-251-247",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0021-158-98-99-116",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump02-158-98-21-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp1-158-98-21-211",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0086-100-79-236-88",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mktmsjht1-158-98-21-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXE1231E-100-79-236-94",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH001-158-98-248-238",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump02-158-98-21-9",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh02-100-79-236-97",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AEO-ae3jph01-158-98-248-78",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-160",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-156",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4536-BDS-Flow-from-Clients"
    notes        = "SR50927643 SR51243811 SR51365705 RITM0114423 RITM0126093 RITM0139187"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-prodnlbds01-146-89-167-196",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01-158-98-21-69",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVPPDAL1-100-79-236-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VISR2LCACF-01-62-185-95-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpdev1-158-98-23-226",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp2-158-98-21-212",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plwa2tr01srrm-158-98-154-41",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-158-98-24-203",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpqa1-158-98-23-225",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump02-158-98-21-70",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GSNI-BDS-Clients",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht2-158-98-21-215",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp2-158-98-23-194",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IST-TRSO-158-98-136-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01t-158-98-21-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVOSDAL1-100-79-236-28",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-lu01vre02sr12rm-129-39-46-109",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp1-158-98-21-211",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-158-98-24-204",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP01-158-98-132-88",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-lu01vre01sr12rm-129-39-46-108",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht1-158-98-21-214",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP02-158-98-132-89",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp1-158-98-23-193",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IST-TRSO-158-98-136-100"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP",
      "/infra/domains/default/groups/TF-EU1-HOST-HRES-CACF-BDS-Child",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1hr1lpcacfbds-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-prodnlbds01-146-89-167-196",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01-158-98-21-69",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVPPDAL1-100-79-236-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VISR2LCACF-01-62-185-95-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-100-87-2-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpdev1-158-98-23-226",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp2-158-98-21-212",
      "/infra/domains/default/groups/TF-EU1-HOST-HRES-CACF-BDS-Child",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-158-98-24-203",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plwa2tr01srrm-158-98-154-41",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpqa1-158-98-23-225",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump02-158-98-21-70",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GSNI-BDS-Clients",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht2-158-98-21-215",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp2-158-98-23-194",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1hr1lpcacfbds-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IST-TRSO-158-98-136-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01t-158-98-21-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVOSDAL1-100-79-236-28",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-lu01vre02sr12rm-129-39-46-109",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp1-158-98-21-211",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-158-98-24-204",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP01-158-98-132-88",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-lu01vre01sr12rm-129-39-46-108",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht1-158-98-21-214",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IZA-ENI-L-JUMP02-158-98-132-89",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp1-158-98-23-193",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IST-TRSO-158-98-136-100"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4537-HA-Proxy-to-Master-BDS-Repo"
    notes        = "RITM0139187"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4538-LB-to-HA-Proxy-nodes"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-OUT"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/Netcool_16443-17443",
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-OUT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4664-SRES-jump-to-hres-proxy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-Proxy-eu1h1lpta2hap",
      "/infra/domains/default/groups/TF-EU1-SG-eu1h1lpta1hap-Proxy"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS",
      "/infra/services/BDS-8081",
      "/infra/services/SSH",
      "/infra/services/HTTP",
      "/infra/services/RDP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-Proxy-eu1h1lpta2hap",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-EU1-SG-eu1h1lpta1hap-Proxy"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4682-DA-OVPN-Servers-to-HRES-In-Proxy"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4684-HA-Proxy-to-NEXT"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster1-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster3-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster1-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster3-VIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4709-Rule-for-BDS-Onboarding-"
    notes        = "SR50916572 SR50934672 SR50966140 SR50966142 SR50965016 SR51038896 SR51098087 SR51135113 SR51309592 SR51428695 RITM0118346 RITM0121146"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH01-158-98-21-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ1-100-87-130-52",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS000ASLR4-158-98-248-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tmaajh01-100-79-236-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0081-158-98-99-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP08QIH000ASLR4-158-98-99-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-87-2-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-140",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZNR-S00X2269-158-98-99-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS020ASLR4-158-98-248-181",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0083-158-98-99-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01-158-98-21-8",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH002-158-98-248-239",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp2-158-98-21-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod02-158-98-23-202",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-JCC",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh02-100-79-236-135",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ2-100-87-130-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl02-158-98-22-18",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-100-79-236-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-139",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJDR4SG1-158-98-104-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH02-100-79-236-39",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmngwsb1-158-98-24-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod01-158-98-23-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-150",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-155",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH04-100-79-236-148",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-79-236-133",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-141",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS000ASLR4-158-98-248-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS030ASLR4-158-98-99-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump1-158-98-251-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump02-158-98-21-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mktmsjht1-158-98-21-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXE1231E-100-79-236-94",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH001-158-98-248-238",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump02-158-98-21-9",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh02-100-79-236-97",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-160",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01-158-98-21-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH99-158-98-21-123",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-137",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-87-34-33",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT2-100-79-236-149",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-79-236-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ1-100-87-130-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT1-100-79-236-145",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacftest11-158-98-23-238",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS040ASLR4-158-98-248-182",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-87-2-65",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXEF101E-100-79-236-95",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm91-100-79-236-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansb1-158-98-101-37",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacftest01-158-98-23-233",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm11-100-79-236-100",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS02-158-98-100-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-136",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-79-236-129",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-87-2-64",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump2-158-98-251-62",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansb1-158-98-101-36",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-79-236-134",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NXI",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl02-158-98-22-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl01-158-98-22-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-79-236-131",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10071-158-98-99-237",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacfprod11-158-98-23-206",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-100-79-236-143",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-MMO",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10061-158-98-99-235",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01t-158-98-21-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-159",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ2-100-87-130-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-87-34-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-rdajump1-158-98-251-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNW-mlmjmp01-158-98-99-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH01-100-79-236-38",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NHG-MADLVJH01VM-158-98-20-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NFC-svsp951-100-87-34-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJTR4S01-158-98-104-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01t-158-98-21-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tncoem12-100-79-236-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmngwsb1-158-98-24-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl01-158-98-22-17",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh01-100-79-236-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-qmaajh01-100-79-236-98",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-OCS",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-154",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH02-100-79-236-144",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-tksmsjhp1-158-98-21-243",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS01-158-98-100-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-87-2-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-NRK",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJCHBSV1946-158-98-20-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp1-158-98-21-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-79-236-93",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-79-236-130",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-AFL"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10061-158-98-99-235",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ2-100-87-130-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ1-100-87-130-52",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ1-100-87-130-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZNR-S00X2269-158-98-99-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10071-158-98-99-237",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ2-100-87-130-53",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-BDS-HTTPSProxy-JP-Shared-Prod"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH01-158-98-21-122",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ1-100-87-130-52",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS000ASLR4-158-98-248-166",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tmaajh01-100-79-236-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0081-158-98-99-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP08QIH000ASLR4-158-98-99-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp11h-100-87-2-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-140",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZNR-S00X2269-158-98-99-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS020ASLR4-158-98-248-181",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0083-158-98-99-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01-158-98-21-8",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH002-158-98-248-239",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp2-158-98-21-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod02-158-98-23-202",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-JCC",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh02-100-79-236-135",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PATCKCJ2-100-87-130-53",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl02-158-98-22-18",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-100-79-236-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-139",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJDR4SG1-158-98-104-157",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp31",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh01-100-79-236-138",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH02-100-79-236-39",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmngwsb1-158-98-24-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacfprod01-158-98-23-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-02-VIP-100-79-236-142",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-REA-H031S3448-100-79-236-150",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-155",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH04-100-79-236-148",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSORJH01-100-79-236-133",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-141",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS000ASLR4-158-98-248-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP080AS030ASLR4-158-98-99-147",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump1-158-98-251-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH03-04-VIP-100-79-236-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump02-158-98-21-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mktmsjht1-158-98-21-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXE1231E-100-79-236-94",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AML-SD1JPH001-158-98-248-238",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump02-158-98-21-9",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh02-100-79-236-97",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh02-100-79-236-160",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-eesojh02-100-79-236-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01-158-98-21-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH99-158-98-21-123",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-137",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-79-236-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT2-100-79-236-149",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ1-100-87-130-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-87-34-33",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacftest11-158-98-23-238",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-BDS-HTTPSProxy-JP-Shared-Prod",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS040ASLR4-158-98-248-182",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-87-2-65",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXEF101E-100-79-236-95",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm91-100-79-236-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-79-236-93",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansb1-158-98-101-37",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacftest01-158-98-23-233",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm11-100-79-236-100",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS02-158-98-100-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-136",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-79-236-129",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-87-2-64",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump2-158-98-251-62",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansb1-158-98-101-36",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-79-236-134",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NXI",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl02-158-98-22-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl01-158-98-22-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-79-236-131",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10071-158-98-99-237",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacfprod11-158-98-23-206",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-100-79-236-143",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-MMO",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10061-158-98-99-235",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01t-158-98-21-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-159",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ2-100-87-130-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-87-34-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-rdajump1-158-98-251-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNW-mlmjmp01-158-98-99-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH01-100-79-236-38",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NHG-MADLVJH01VM-158-98-20-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NFC-svsp951-100-87-34-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJTR4S01-158-98-104-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01t-158-98-21-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tncoem12-100-79-236-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmngwsb1-158-98-24-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl01-158-98-22-17",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh01-100-79-236-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-qmaajh01-100-79-236-98",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-OCS",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-154",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-tksmsjhp1-158-98-21-243",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS01-158-98-100-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-87-2-99",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-AFL",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-BDS-NRK",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJCHBSV1946-158-98-20-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp1-158-98-21-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT1-100-79-236-145",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-79-236-130",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH02-100-79-236-144"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4728-OCP-to-http-proxy-2-vip"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster02",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster03"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-443",
      "/infra/services/TCP-16443-17443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4729-hres-lb1-to-http-proxy-2"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-Proxy-eu1h1lpta2hap"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-Proxy-eu1h1lpta2hap",
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4730-Http-proxy-vip-to-http-proxy-2"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap1"
    ]
    action = "ALLOW"
    services = [

    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap2",
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap1"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4731-Copy-of-Http-proxy-vip-to-http-proxy-2-"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap1"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-443",
      "/infra/services/TCP-16443-17443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpta2hap1",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4771-CPrem-Netcool-to-HA-Proxy-IN"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-shnisap1-100-79-236-83",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-79-236-80",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-lpar7r7-100-79-236-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact1-RealIP-100-107-4-1",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact1-100-79-236-84",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0167-212-63-226-232",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA4CNHL-159-61-70-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-lpar7r7-RealIP-100-105-20-60",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0166-212-63-226-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860020-RealIP-100-107-10-6",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact2-RealIP-100-107-4-2",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact2-100-79-236-85",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-shnisap1-RealIP-100-105-20-9",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860021-RealIP-100-107-10-7",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA3CNHL-159-61-70-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl004-84-255-92-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-79-236-81",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl003-84-255-92-72"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-shnisap1-100-79-236-83",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-79-236-80",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-lpar7r7-100-79-236-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact1-100-79-236-84",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact1-RealIP-100-107-4-1",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0167-212-63-226-232",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA4CNHL-159-61-70-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-lpar7r7-RealIP-100-105-20-60",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0166-212-63-226-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860020-RealIP-100-107-10-6",
      "/infra/domains/default/groups/TF-EU1-IPSET-CACF-eu1h1lpta1hap-vip-158-87-57-4",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact2-RealIP-100-107-4-2",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact2-100-79-236-85",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-shnisap1-RealIP-100-105-20-9",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860021-RealIP-100-107-10-7",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA3CNHL-159-61-70-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl004-84-255-92-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-79-236-81",
      "/infra/domains/default/groups/TF-EU1-IPSET-HREST-eu1h1lpta1hap-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl003-84-255-92-72"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4777-HA-Proxy-OUT-to-CPrem-Netcool"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-OUT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl004-84-255-92-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA4CNHL-159-61-70-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-79-236-81",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-shnisap1-100-79-236-83",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-79-236-80",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0166-212-63-226-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-lpar7r7-100-79-236-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl003-84-255-92-72",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact2-100-79-236-85",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact1-100-79-236-84",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0167-212-63-226-232",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA3CNHL-159-61-70-49"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Netcool_16443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl004-84-255-92-73",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA4CNHL-159-61-70-14",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860021-100-79-236-81",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-shnisap1-100-79-236-83",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860020-100-79-236-80",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0166-212-63-226-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-lpar7r7-100-79-236-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-OVPN-prodeuovpn-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KMD-kmdlnxncl003-84-255-92-72",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact2-100-79-236-85",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-OUT",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-KXB-kbbiImpact1-100-79-236-84",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IS4F-xl01lsrv0167-212-63-226-232",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CNHi-APPA3CNHL-159-61-70-49"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-4778-NEXT-to-HA-Proxy-OUT"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster03"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/Netcool_16443-17443"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2hap-vip",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster03"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-6003-HRES-LB-to-CAR"
    notes        = "SR50876819"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpcarwas1000"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-hres1-lb1-PrimaryIP",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpcarwas1000"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-6004-CMOS-to-HRES-LB-(CAR)"
    notes        = "SR50876819"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-CMOS-Orchestrator"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-LB-VIP-100-79-240-18"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/HTTPS"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-CMOS-Orchestrator",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-LB-VIP-100-79-240-18"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-6391-ISPW-JH1->-GSW-JH2"
    notes        = "SR50951662 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-7094-<NOT-DEFINED>"
    notes        = "SR51044678 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-4500"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp2"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-7095-HRES-to-SRES"
    notes        = "SR51044678 "
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp2"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esd3-VIP"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/TCP-7705"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp1",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1h1lpgsntnp2",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esd3-VIP"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-8361-HA-Proxy-OUT-to-DA-BDS-Child"
    notes        = "RITM0074820"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-OUT"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-prodnlbds01-146-89-167-196"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-prodnlbds01-146-89-167-196",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-OUT"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-8959-SRES-to-HRES-BDS-child"
    notes        = "RITM0138596"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp02"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/BDS-8081"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01",
      "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp02"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3881-SSH-Proxy-JP-Shared-nodes-to-DA-JP-2"
    notes        = "SR50884065 SR50934669 SR50966140 SR50966142 SR51038895 SR51098084 SR51135104 SR51243810 SR51309582 SR51365702 SR51428693 RITM0074632 RITM0114423 RITM0118346 RITM0121146 RITM0126093 RITM0135034"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSD-Jhlxsoda02-129-39-115-253",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp1-158-98-23-193",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTB-ucpjum02-100-79-236-36",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0020-158-98-99-115",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01-158-98-21-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH99-158-98-21-123",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-137",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-79-236-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT2-100-79-236-149",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0084-100-79-236-89",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ1-100-87-130-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021rb-100-79-236-107",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT1-100-79-236-145",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-d4lxta01-158-98-20-143",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp2-158-98-21-212",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacftest11-158-98-23-238",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS040ASLR4-158-98-248-182",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KYM-ibmjumphost01-158-98-251-26",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXEF101E-100-79-236-95",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm91-100-79-236-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1ht-100-79-236-109",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-srsrm91-129-39-125-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacftest01-158-98-23-233",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm11-100-79-236-100",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SHP-shun175-158-98-100-83",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS02-158-98-100-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-136",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-79-236-129",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump2-158-98-251-62",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNL-DAJMPAPP01-158-98-100-128",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1hc-100-79-236-115",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SHP-shun114-158-98-100-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FUH-mslxda01-100-79-236-42",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansb1-158-98-101-36",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-79-236-134",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NXI",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MHI-mhiplcop01-158-98-248-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZNR-S00X0439-158-98-99-137",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVPPDAL1-158-98-20-221",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2ht-100-79-236-110",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NFC-svsp951-100-79-236-91",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl02-158-98-22-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ra-100-79-236-106",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht1-158-98-21-214",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl01-158-98-22-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-79-236-131",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10071-158-98-99-237",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-RCJ-DAQAIP01-158-98-101-148",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SKO-mtkrhel02-158-98-24-159",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZBS-z11200197-158-98-99-186",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacfprod11-158-98-23-206",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-100-79-236-143",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10061-158-98-99-235",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01t-158-98-21-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-159",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ2-100-87-130-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-rdajump1-158-98-251-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNW-mlmjmp01-158-98-99-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH01-100-79-236-38",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NHG-MADLVJH01VM-158-98-20-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plwa2tr01srrm-158-98-154-41",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-79-236-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0014-158-98-99-112",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-79-236-33",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpqa1-158-98-23-225",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump02-158-98-21-70",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FUH-mslxda02-100-79-236-43",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ra-158-98-104-90",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJTR4S01-158-98-104-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AFL-rzzljb01-130-103-180-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-RCJ-DAPRIP01-158-98-101-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SHK-rc100s-158-98-251-176",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01t-158-98-21-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MHI-mhiplcop02-158-98-248-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tncoem12-100-79-236-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmngwsb1-158-98-24-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01t-158-98-21-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl01-158-98-22-17",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh01-100-79-236-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSD-Jhlxsoda01-129-39-115-248",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-qmaajh01-100-79-236-98",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansb1-158-98-101-37",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDX00002-158-98-24-174",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FBK-pmwvjh02-129-39-115-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-154",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-158-98-24-204",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDX00001-158-98-24-173",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0015-158-98-99-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-tksmsjhp1-158-98-21-243",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS01-158-98-100-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-s1lxta01-158-98-20-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2ht-100-79-236-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0015-158-98-99-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KYM-ibmjumphost02-158-98-251-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJCHBSV1946-158-98-20-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTB-uctjum01-100-79-236-37",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp1-158-98-21-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJCHBSV923-100-87-34-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-79-236-93",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-79-236-130",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH02-100-79-236-144"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSD-Jhlxsoda02-129-39-115-253",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjp1-158-98-23-193",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PM1-TSASGW01-158-98-99-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTB-ucpjum02-100-79-236-36",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0020-158-98-99-115",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01-158-98-21-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KOB-DA-JH99-158-98-21-123",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh02-100-79-236-137",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-79-236-92",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT2-100-79-236-149",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0084-100-79-236-89",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ1-100-87-130-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021rb-100-79-236-107",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJHT1-100-79-236-145",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-d4lxta01-158-98-20-143",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-arsmsjhp2-158-98-21-212",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacftest11-158-98-23-238",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ASL-JP071AS040ASLR4-158-98-248-182",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KYM-ibmjumphost01-158-98-251-26",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SOM-YXEF101E-100-79-236-95",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm91-100-79-236-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1ht-100-79-236-109",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-srsrm91-129-39-125-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansa1-100-87-2-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-sdmjhscacftest01-158-98-23-233",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pncomm11-100-79-236-100",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SHP-shun175-158-98-100-83",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS02-158-98-100-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ccsojh01-100-79-236-136",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp01-100-79-236-129",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-pdajump2-158-98-251-62",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNL-DAJMPAPP01-158-98-100-128",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp1hc-100-79-236-115",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SHP-shun114-158-98-100-82",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FUH-mslxda01-100-79-236-42",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansb1-158-98-101-36",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ttsojh01-100-79-236-134",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NXI",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MHI-mhiplcop01-158-98-248-240",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZNR-S00X0439-158-98-99-137",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NTN-SVPPDAL1-158-98-20-221",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2ht-100-79-236-110",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NFC-svsp951-100-79-236-91",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl02-158-98-22-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ra-100-79-236-106",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-artmsjht1-158-98-21-214",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-smpxl01-158-98-22-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-bmsjmp01-100-79-236-131",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10071-158-98-99-237",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-RCJ-DAQAIP01-158-98-101-148",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SKO-mtkrhel02-158-98-24-159",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ZBS-z11200197-158-98-99-186",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-XDM-sdmjhscacfprod11-158-98-23-206",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH01-100-79-236-143",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-DKN-daj10061-158-98-99-235",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YAM-jdkhjump01t-158-98-21-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SBN-ddsojh01-100-79-236-159",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SG1-PAOCKCJ2-100-87-130-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-rdajump1-158-98-251-75",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNW-mlmjmp01-158-98-99-200",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-TDS-SSOHJH01-100-79-236-38",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plpa2tr01srrm-158-98-154-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NHG-MADLVJH01VM-158-98-20-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PL-plwa2tr01srrm-158-98-154-41",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MEI-jbp21h-100-79-236-30",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0014-158-98-99-112",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph001-100-79-236-33",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JSI-masdmjpqa1-158-98-23-225",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump02-158-98-21-70",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FUH-mslxda02-100-79-236-43",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SNY-gws021ra-158-98-104-90",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTI-IJTR4S01-158-98-104-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AFL-rzzljb01-130-103-180-231",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-RCJ-DAPRIP01-158-98-101-146",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SHK-rc100s-158-98-251-176",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-AWA-jdknjump01t-158-98-21-32",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MHI-mhiplcop02-158-98-248-241",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-tncoem12-100-79-236-101",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmngwsb1-158-98-24-201",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-HAB-82bkhjump01t-158-98-21-103",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-EBI-tmpxl01-158-98-22-17",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-pmaajh01-100-79-236-96",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSD-Jhlxsoda01-129-39-115-248",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MSM-qmaajh01-100-79-236-98",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-rmnansb1-158-98-101-37",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDX00002-158-98-24-174",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FBK-pmwvjh02-129-39-115-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph02-100-79-236-154",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-NRK-hmnansa1-158-98-24-204",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JCC-MDX00001-158-98-24-173",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0015-158-98-99-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-tksmsjhp1-158-98-21-243",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-YMD-YMDJHS01-158-98-100-102",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-PJT-s1lxta01-158-98-20-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MBK-xzjmp2ht-100-79-236-114",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-SSH-prvlkojph01-100-79-236-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-MMO-ISAP0015-158-98-99-113",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KYM-ibmjumphost02-158-98-251-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJCHBSV1946-158-98-20-180",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-JTB-uctjum01-100-79-236-37",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-E82-mksmsjhp1-158-98-21-151",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-KKL-KLJCHBSV923-100-87-34-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-ENE-amjph002-100-79-236-93",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-FNS-mmsjmp02-100-79-236-130",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-JP-CHI-SASAMJH02-100-79-236-144",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
    display_name = "TF-3704-SSH-Proxy-EU-Shared-nodes-to-DA-EU-Shared-2"
    notes        = "SR50927643"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap05sr04rm-158-98-140-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdjmp02-100-79-236-77",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DSG-dkcc3jm020dsgrm-158-98-68-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-WPED0PJMP0001-100-79-236-11-NAT",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HMC-exs4icc01sp-100-79-236-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-FMS-fmspsobox1-158-98-146-196",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LUC-trwpsobox2-158-98-66-133",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CHR-ODIBML001DAAP01-oddc-151-171-86-71",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VIDR16LJUMP-02-195-118-243-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-fi01vgp01sr26rm-158-98-130-33",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CSA-Ganzhoup12-100-79-236-18",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WSS-it06qih000wssrm-129-39-135-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-FR2AVLBINA1-100-79-236-119",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap02sr18rm-158-98-141-24",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SLV-sollnx010-150-251-116-58",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-WPED0PJMP0002-100-79-236-12-NAT",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860001-100-79-236-64",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WFI-FC-LSA-FAIJH1P-129-39-135-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ABZ-VISR5LIEM-02-62-185-95-185",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxfi2-158-98-145-6",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-6-chwtqih020wscrm-195-75-20-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SEI-sesc2ih04ir04rm-158-98-129-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-SETPSFIUPR01-100-79-236-23",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PTG-PT012SI02IR01RM-158-98-137-252",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CSA-Ganzhoup11-100-79-236-17",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IT2-vielogin1-129-39-157-230",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IDK-dkccqap02ir12rm-158-98-71-167",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-fi02vgp01sr26rm-158-98-130-35",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WAZ-AZRPAPF007-129-39-135-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LKED0PJMP0001-100-79-236-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-RAV-VIE43DYN-02-100-79-236-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-PA1AVLBINA2-100-79-236-123",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-lxjmpap1-100-79-236-25",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-FR2AVLBINA2-100-79-236-120",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxfi1-158-98-145-5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DSG-dkcc3jm010dsgrm-158-98-68-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-5-chwtqih010wscrm-195-75-20-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPALCNHL-159-61-70-34",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ORK-sescqap01sr07rm-129-39-150-164",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SDV-seiux7-164-4-87-199",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-4-jump1sha-195-118-230-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GH2-ibmpsoboxgh21-100-79-236-62",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD10018D3013-100-79-236-66",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AP5-ibmpsoboxap52-100-79-236-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DAEU-OVPN-SSHProxy-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LUC-trwpsobox1-158-98-66-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HMC-exs4icc02sp-100-79-236-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-3-ibmpsoboxfs1-158-98-144-46",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-PA1AVLBINA3-100-79-236-124",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SDV-seiux6-164-4-87-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ACO-atllx007-100-79-236-52",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AMS-ams0pxe01ls-149-131-102-163",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AMS-ams0log01ls-149-131-102-164",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-1-Jump1mac-195-118-230-169",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CAB-viep78lssh-01-158-98-87-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CAB-viep78lssh-02-158-98-87-48",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdibmcc01-100-79-236-72",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GNF-pvlipsoft1-100-79-236-70",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BTG-VISR5LIEM-02-62-185-95-185",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-2-ibmpsoboxes2-129-39-159-106",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ABZ-VISR5LIEM-01-62-185-95-184",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SC5-dautounx-152-90-89-34",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SAI-sto00-lx156-194-69-35-59",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CHR-shibml001daap01-shdc-151-171-86-64",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-1-ibmpsoboxes1-129-39-159-105",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPAICNHL-159-61-70-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Portugal-EUS-1-pt012ap03sr01rm-158-98-74-150",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IB1-VISR5LIEM-01-158-98-139-118",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ORK-sescqap02sr07rm-129-39-150-174",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-STG-dkccqap06sr04rm-158-98-140-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-I8M-ibmtpsobox1a1-194-194-236-72",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BTG-VISR5LIEM-01-62-185-95-184",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SLV-sollnx011-150-251-116-59",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HEN-henpsobox1-158-98-224-20",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-6-it01cih01dr02rm-158-98-138-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SCU-srv-dna-01-100-79-236-58",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-I8M-ibmtpsobox2a1-194-194-236-73"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap05sr04rm-158-98-140-152",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdjmp02-100-79-236-77",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DSG-dkcc3jm020dsgrm-158-98-68-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-WPED0PJMP0001-100-79-236-11-NAT",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HMC-exs4icc01sp-100-79-236-54",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-FMS-fmspsobox1-158-98-146-196",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LUC-trwpsobox2-158-98-66-133",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CHR-ODIBML001DAAP01-oddc-151-171-86-71",
      "/infra/domains/default/groups/TF-EU1-IPSET-TWINS-VIDR16LJUMP-02-195-118-243-158",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-fi01vgp01sr26rm-158-98-130-33",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CSA-Ganzhoup12-100-79-236-18",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WSS-it06qih000wssrm-129-39-135-56",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-FR2AVLBINA1-100-79-236-119",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-dkccqap02sr18rm-158-98-141-24",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SLV-sollnx010-150-251-116-58",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-WPED0PJMP0002-100-79-236-12-NAT",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD1001860001-100-79-236-64",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WFI-FC-LSA-FAIJH1P-129-39-135-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ABZ-VISR5LIEM-02-62-185-95-185",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxfi2-158-98-145-6",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-6-chwtqih020wscrm-195-75-20-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SEI-sesc2ih04ir04rm-158-98-129-153",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BCP-SETPSFIUPR01-100-79-236-23",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-PTG-PT012SI02IR01RM-158-98-137-252",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CSA-Ganzhoup11-100-79-236-17",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IT2-vielogin1-129-39-157-230",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IDK-dkccqap02ir12rm-158-98-71-167",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-fi02vgp01sr26rm-158-98-130-35",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WAZ-AZRPAPF007-129-39-135-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-WPP-LKED0PJMP0001-100-79-236-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-RAV-VIE43DYN-02-100-79-236-57",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-PA1AVLBINA2-100-79-236-123",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BES-lxjmpap1-100-79-236-25",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-FR2AVLBINA2-100-79-236-120",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ITD-ibmpsoboxfi1-158-98-145-5",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-DSG-dkcc3jm010dsgrm-158-98-68-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-5-chwtqih010wscrm-195-75-20-44",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPALCNHL-159-61-70-34",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ORK-sescqap01sr07rm-129-39-150-164",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SDV-seiux7-164-4-87-199",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-4-jump1sha-195-118-230-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GH2-ibmpsoboxgh21-100-79-236-62",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ECI-MXCPD10018D3013-100-79-236-66",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AP5-ibmpsoboxap52-100-79-236-61",
      "/infra/domains/default/groups/TF-EU1-IPSET-DAEU-OVPN-SSHProxy-146-89-167-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-LUC-trwpsobox1-158-98-66-132",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HMC-exs4icc02sp-100-79-236-55",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-3-ibmpsoboxfs1-158-98-144-46",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BFS-PA1AVLBINA3-100-79-236-124",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SDV-seiux6-164-4-87-198",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ACO-atllx007-100-79-236-52",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AMS-ams0pxe01ls-149-131-102-163",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-AMS-ams0log01ls-149-131-102-164",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-1-Jump1mac-195-118-230-169",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CAB-viep78lssh-01-158-98-87-49",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CAB-viep78lssh-02-158-98-87-48",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-UCE-prdibmcc01-100-79-236-72",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-GNF-pvlipsoft1-100-79-236-70",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BTG-VISR5LIEM-02-62-185-95-185",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-2-ibmpsoboxes2-129-39-159-106",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ABZ-VISR5LIEM-01-62-185-95-184",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SC5-dautounx-152-90-89-34",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SAI-sto00-lx156-194-69-35-59",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-CHR-shibml001daap01-shdc-151-171-86-64",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-DACH-EUS-1-ibmpsoboxes1-129-39-159-105",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-EUS-APPAICNHL-159-61-70-27",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Portugal-EUS-1-pt012ap03sr01rm-158-98-74-150",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-IB1-VISR5LIEM-01-158-98-139-118",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ORK-sescqap02sr07rm-129-39-150-174",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-STG-dkccqap06sr04rm-158-98-140-156",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-I8M-ibmtpsobox1a1-194-194-236-72",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-BTG-VISR5LIEM-01-62-185-95-184",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SLV-sollnx011-150-251-116-59",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-HEN-henpsobox1-158-98-224-20",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-ShJH-Italy-EUS-6-it01cih01dr02rm-158-98-138-45",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-SCU-srv-dna-01-100-79-236-58",
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-I8M-ibmtpsobox2a1-194-194-236-73",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-SharedProd"
    ]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-HRES-EU1"
    }
  }
  rule {
         display_name = "TF-4537-HA-Proxy-to-Master-BDS-Repo"
         notes        = "RITM0139187"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-SG-HRES-HAProxy-IN",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-EU1"
            }
      }
}
