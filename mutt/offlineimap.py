from subprocess import check_output
import os

def get_pass(mailbox):
    gpg = [
        'pass', 'email/{}'.format(mailbox)
    ]
    return check_output(gpg).strip()
