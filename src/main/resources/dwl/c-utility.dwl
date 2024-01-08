%dw 2.0
output application/java
---
{
	Id: payload.Id, 
	NumberOfEmployees: if (payload.NumberOfEmployees != null) (payload.NumberOfEmployees + 1) as Number else null,
	"type": payload.'type'
}