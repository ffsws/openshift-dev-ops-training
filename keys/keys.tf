
provider "aws" {
  region = "eu-central-1"
  version = "~> 2.7"
}

resource "aws_key_pair" "public-key-0" {
  key_name = "training-0"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUoxXpxlVcIyLYhvTTHT/dIcd4xnUYrSC/3WGslJgzZuTmdR6Rfg2MIblzQ9Y6EF8eYCme3Ks3Bud4IP1q8W77fLpti1xHlvU72Ri9PB9Sc5/cQnBUfB5X8XIjTrko30jyWaB32b83S+Tn3ukmbLHY3D7d8hMPWgMRcCT9gAmQ/sA1YVtMMl4WFgt4pvNGhR8MODQtD091oq2OZxgz2BKhZ26G27BR++OCZ2iLzs85HuRxTKDj/8aAsFQ368swNoguIfCO3+XL9b9Hmx1VHBqrfJNYE3LB7/rS6Uy5c539AALtiM5IIBv07mdMPT15ss2WMB2aC+gcFKbQ3nyPOBLaWDXfAvDV1V6dF2ilUA4g8TgGSBr6CZKvDwHXtuFOHudc8Oy37oOfyaztqS15CP075pbQvJqfVo0KefYRv8ycetLl8HzkOWxWltjtmYbdMrjF3COeq4AexkgSZ4X+MYiap+E13m7OCPwCc5xvUR5CgtMK+X23NdguQvaiZrUDBV2kvH2APkeUpQjJho6wJV5vourQgr6MPmZpbUeFgZAQ92CNBdfWe2Df+G51Uc4OQLe0fTnDkRphBIj7u6Ylndd1D1W3G97L/E9HKVMXf7myl74TyAvzkf+lTCTCbEejb+dr+MIXhEUqjykH2Rrw2IBmePbDK4D0Yi77KNsgK4bYCQ== lukeelten@lukesPC"
}

resource "aws_key_pair" "public-key-1" {
  key_name = "training-1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDXjZDI6iVJ3fxpNcP2v8ESbdsimuxRcy/DfWGMKcVtnLT6FfbJrrR6wJf3ppfdYXIokrQxCOTvsVDpJIzsPb2m/knC0QV4m1NO5pep9wF124idLhoa9BeIh1KfKxtVso5mhtUt58Y+LVArMNMDDMTAMh5fe/Dw+3EGWBNzzZ1tPq9dpIDkM4nQ09P6e5Z4uHZMYzkVrHzhosbmB7+c4Rw6HRurMqfUBknr18EA1mQ8dE8AN0piW+ze6XSJWsh8cWDoJZmrtIA+AnNv+16rROZkmXqtHN9yoqL3xz1GHIBdF4YHvJXWlR2mVF+YUTlxaYXDmvYft0GCp/iZX3NwzODGDIpSnl+pj3prXdlTp7wK1B7dii/yXgzNOo4ldHl9U9sYaFgepGlgHaaJOCdKvS78UBk1h5DjQ03pFUioSVrp3TpbZe7jE1NJhL0Q6IWQGBqOeGDKOQjXyQ7zCCHBkY3rkZBOfyCrQogo/lEzi4bPwLhuBDwrE5/pvc/MrKwxYCP70FHVMYhTesbscI1WuTmP9DY3HvTpkA4t+885964Wc9AKKDuqEkk4Nmf53Nc9l+xb9gkHKC0Aj9m6FU0q+G6uLE9RiXbkKOGBDHZK6DgS7qKVD32OzggTIhc5WL1r+ruspxLwaHBz84XWEiKieBpssB1JjUgxP2Ae2H9XZmcnPQ== Training 1"
}

resource "aws_key_pair" "public-key-2" {
  key_name = "training-2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4JWsJUrajStq4vyn85qdFTHSccoNyWAqffYgXioZbeFnCspT4TyY7/DbVirvBloUXR3SQ0IUlnG3bYBOPweMow1HerNsFWLQpNrdu6a5YqVNHhbEHPq5hrcT9tL3xHFms4v7THn9agoGNYKyieESEIdFgKhV5ZsHo+isrC9zGQ2qQ8d4IBQ2EAA9C0BovPWTjKEHLDcRajd8hv3AaXAlj2Q5CIe8M3MG2O2kxw7hgeV1uYSBgKNMtQ4Zj9GYn0knN4C60bTE+pQACaONdaEzDA7TW4FaCOQ5L5UZdFU+slvMcpdm4Zu7TUmKJ/OCHyvdIleLX2VGwdnOPTAOLjszwN9FU3SaGOq6bf12tE4Iia7nPV7hDUaYw0TrLAVyCc1iQ4kBsr7fF2luUUfjDXGC2S+qiEqo3xeRbunqGVqC2XVA8iCQV8pZp97IpU4OsFDGfDHs4W5XIBRcWxVM4XhCK/01mRm+aAn/XH3MVU8P817HcQWdeRRqRsBS1Gd7YV17qQjW/3Xu4+mDaFpjrKoJcQ5kv+KMb2bwh1/rUdl9tqiQwAK9j7XfkjQV9jT+aQ0QXqqEj+ZNLdCqCGAxK+b5vpQzFQKCrejM+IV60PbIBBxleooGpXEzFSO1i7NRv3a5gcpT37tOSJk7LCXlSdnQJspLGQWAOj3/SwVbfPNlJMw== Training 2"
}

resource "aws_key_pair" "public-key-3" {
  key_name = "training-3"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCcP1Dgxgym/Cp6Qg8lDl2WNIVazm7WTGY/EsqB1a42EQfFaQUz2Ngarlzj1j3nd6YWOESRWwEN0ulPvKFnFAGhSGwhmGcH8GY2Hr1Gm5uX+t5yQ/Q7F3aCH37wvETLR4I4y+GpLBSUodrQo7HGa5+00VsrVjuqp7PZ09JA7ZsneqQoO+EolLIXBNcNfRQK0o7EyLVSrp1wRNUWz8EiTsOnqjJDMiQsN5lRQ+V6HU6mupvCrtYTkG6K4iodmKM5M7weTvekwHuyT/q2tHERmtLVoSr+Pl7qat92AlCRnwgBQxOPyEsPGXl4Fp1GBCF3OYDR4xjyj5clpvhlCxkOmCvJhAzNBb+AeqGV3+vX4Ciid18pgQVJJ+e80Hm87PkHWsO8JgzahC6SXD3nNPBtcDAag9QQOErdQJITGLHr4Vh3ZhtGClGs71aOusD04oqA0VnLIpJomQglIU59QIpU6LZrsojCCShzCRzXnAC/jJcSoXnmXHDD06Snv/U0pc9sRBaRz7W8Ds4Vy0ww58m79pFEfItu/+qGTJc5O5HSPOacU3GNhMFEJvrofveovioZmkrHN19tASbZUuO4F+S5inUUaJzIDnRv3dqNEcn2MRJ63IVGhjiW7M6Gp4E9PFOuZARbt70hm26BxDSomVSrU6z+sTNnrphYoZNwDaROk17oUQ== Training 3"
}

resource "aws_key_pair" "public-key-4" {
  key_name = "training-4"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOIH2WzaToBJTU4nwOnCOz7O0Q7ChvaEMDNUTGS5/icGxOu5m2WWQsjP9caeqcRv59JH1wB3MyJiqMMi9ChGgwq2pCL52m47OG0YU51GwNMbqlmFwMgEo1JEGomxMNXNI9IUPCUV9l5JhDP3GZL97YoYqUNEN7gsY1nQZPblUyRw6EiUxSbfTQV1n/3QkrN9GScEW90wwG0APSBY4pwf0mW2QAltBGrE7pN10vUbsLeu6L/JbvbMOv73PuZuW3BfWK7iuChImZjaUmoBXDugT//GnMKKHXdG8Y/tTMCkZBsohxIcqrROYXG1LwYPodMErhrGG9B9W2VMZCRH0ESwZv1itrheiiPTqgSSDxrHq9iKGoGaI5IDx0nnR9HzcRCLO2aGqJDRHb4NGj0lgy7v+T+VXRqD+kTfd3HVwWR1u28SdeboXR+b4DDVZK6n/mX+IbUoa4+NXqs8PCceq228FJFVCATAEzXP68WYSWyAW1cLVSpMPAr8o9Wye53Ll3X7pOeUcpxxBQR/ec4iRcpagX/nxNeF82qpjKTdCV0HaBtc7wCkmpNJ6NsJoTgZHwL4aR6F3kLwNUCX55vMYtwAXgBBc4zD5TPv1MA1ae3bd1WnyurZ+joWbZXnS4oRVSpJ0LjcrxR3LDWtZoONYM0SdDi1Xa5ri4vhDNgXCyZSpZDw== Training 4"
}

resource "aws_key_pair" "public-key-5" {
  key_name = "training-5"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDnOsYDkSC9fYVXE6s2VEJXg59M8xM94VaFknGIvAnYF9YZROjz6ghi/bc65zm+uo/cuuMoPaKWTgDaoj8BzrmEdnbd4dz3hfqzXueN6bPKGPxDIMmnls3jRwG1Dm5++FEVFxygqIEvRzhMg+GBN90UNAEHZEeevyDK4Rx2DpUwEIHsoEuuuGp38uDEMxumXH1DzrZKuRyWO5DEn98jO0IYK4A+OpPa34AEHwH/aniq9kYd4E7qarO5c2y+x6KHG52fxVAvaakuecrc9S2vsG/EO6qk9AtgLLnhgngvZdFh/MePGHpWXmfoD+SXiYdxG88At4zWFsduUS5khA5z1SM757usXejcu0VHxyRAm8uXAVP5m1tRr2MIW5NjA8Gnuh17j9bAi5HWwZAheypSoYXPvIg57WofsOV5NCWYt1XZnI/E96xync3n5IKP8KrRuwahhqjqctHEGRUIoSG/AjTuhoZRfzFBp1Mgzeo6aEsLWOz7X0geLIcB5ZK36QHRMTCiAWm+jvXSW/et3wY/XTRqYrE8xKLOLs1Lq5+9JyoZDydRREx5FwlM5GoYwAlyZTkOrleCOsKXH+fz2xF2xRqgIAbMxJTolXSnhZ6DtvE8md2uZ9O0qBAmEXmgLoCk3IubKtZoi9mpxPlAPPV2E1BBsSuwigDHbNyk2oDmFGc7rw== Training 5"
}
