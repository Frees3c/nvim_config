#!/bin/env python3

import requests

r = requests.get("http://frees3c.co.uk")

def test():
   print(r.text)

test()


