The main purpose of this docker image is to create a vulnerable environment to exploit [BREACH](https://en.wikipedia.org/wiki/BREACH). To run this image after installing Docker, use a command like this:

```bash
$ sudo docker run --rm -p 443:443 jselvi/breach
```

Now you can test if we are facing a vulnerable web server by using a tool such as testssl.sh:

```bash
$ testssl.sh --breach https://127.0.0.1

BREACH (CVE-2013-3587)
potentially NOT ok, uses gzip HTTP compression. - only supplied "/" tested
Can be ignored for static pages or if no secrets in the page
```

The legitimate user should visit `https://127.0.0.1/?whatever`. This page will send a response with an anti-csrf token together with `whatever`.

An attacker should be able to exploit BREACH and obtain the anti-csrf token value. For this example, this token is static and never changes. It doesn't really matter to exploit the issue, and it was much easier to implement.
