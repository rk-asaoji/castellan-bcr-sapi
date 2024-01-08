%dw 2.0
output application/json
---
{
  header: {
    apiName: p('secure::api.name'),
    apiVersion: p('secure::api.version'),
    correlationId: vars.transactionID
  },
  data: {
    username: payload.data.username,
    id: payload.data.id,
    email: payload.data.email,
    (vars.response)
  }
}