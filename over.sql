select key
, value
, count(value) over (partision by key)
, sum(value) over (partision by key)
from table
