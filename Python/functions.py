import re

abb_dict = {'ANDHRA PRADESH': 'AP',
            'ARUNACHAL PRADESH': 'AR',
            'ASSAM': 'AS',
            'BIHAR': 'BR',
            'CHHATTISGARH': 'CG',
            'GOA': 'GA',
            'GUJARAT': 'GJ',
            'HARYANA': 'HR',
            'HIMACHAL PRADESH': 'HP',
            'JAMMU AND KASHMIR': 'JK',
            'JHARKHAND': 'JH',
            'KARNATAKA': 'KA',
            'KERALA': 'KL',
            'MADHYA PRADESH': 'MP',
            'MAHARASHTRA': 'MH',
            'MANIPUR': 'MN',
            'MEGHALAYA': 'ML',
            'MIZORAM': 'MZ',
            'NAGALAND': 'NL',
            'ODISHA': 'OR',
            'PUNJAB': 'PB',
            'RAJASTHAN': 'RJ',
            'SIKKIM': 'SK',
            'TAMIL NADU': 'TN',
            'TRIPURA': 'TR',
            'UTTARAKHAND': 'UK',
            'UTTAR PRADESH': 'UP',
            'WEST BENGAL': 'WB',
            'ANDAMAN AND NICOBAR ISLANDS': 'AN',
            'CHANDIGARH': 'CH',
            'DADRA AND NAGAR HAVELI': 'DH',
            'DAMAN AND DIU': 'DD',
            'NATIONAL CAPITAL TERRITORY OF DELHI': 'DL',
            'LAKSHADWEEP': 'LD',
            'PUDUCHERRY': 'PY',
            'TELANGANA': 'TS'}

state_abbr = list(abb_dict.values())
stateabb_pattern = '|'.join(state_abbr)
state_pattern = '|'.join(list(abb_dict.keys()))
state_pattern = state_pattern.lower().title() + stateabb_pattern


# function to return key for any value
def get_key(val, my_dict):
    for key, value in my_dict.items():
        if val == value:
            return key
    return None


def extract_state(address):
    '''
    Returns list of names of the state present in a string
    :param address:
    :return:
    '''
    find_state_abb = re.findall(state_pattern, address,
                                flags=re.IGNORECASE)
    state_present = []
    for i in find_state_abb:
        if i.upper in list(abb_dict.keys()):
            state_present.append(i.upper())
        else:
            state_present.append(get_key(i, abb_dict))
    return ', '.join(state_present)


extract_state('Andhra Pradesh is beside UP')
