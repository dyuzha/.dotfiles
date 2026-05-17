local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Простой текстовый сниппет
ls.add_snippets("all", {
  s("hello", {
    t("Hello, world!")
  })
})

-- Сниппет с вставками
ls.add_snippets("javascript", {
  s("cl", {
    t("console.log("),
    i(1, "variable"),
    t(");")
  })
})

-- Более сложный сниппет с форматированием
ls.add_snippets("python", {
  s("def", fmt([[
    def {}({}):
        {}"""{}"""
        {}
  ]], {
    i(1, "function_name"),
    i(2, "params"),
    i(3, ""),
    i(4, "docstring"),
    i(5, "pass")
  }))
})

ls.add_snippets("yaml", {
  s("k-certificate", fmt([[
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {}
  namespace: {}
spec:
  secretName: {}
  issuerRef:
    name: {}
    kind: {}
  dnsNames:
    - {}
]], {
    i(1, "---"),
    i(2, "---"),
    i(3, "---"),
    i(4, "letsencrypt"),
    i(5, "ClusterIssuer"),
    i(6, "example.com"),
  }
  ))
})

ls.add_snippets("yaml", {
  s("k-cluster-issuer", fmt([[
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: {}
spec:
  acme:
    email: {}
    server: {}
    privateKeySecretRef:
      name: {}
    solvers:
      - http01:
          ingress:
            class: traefik
  ]], {
    i(1, "letsencrypt"),
    i(2, "you@example.com"),
    i(3, "https://acme-v02.api.letsencrypt.org/directory"),
    i(4, "letsencrypt-account-key")
  }
  ))
})
