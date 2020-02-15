from subprocess import check_output
import os

def get_pass(entry):
  gpg = [
      'pass', entry
  ]
  return check_output(gpg).strip()
