---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 19838.
--- DateTime: 2022/10/9 10:02
---

local config = require("cfg_qianghuadz")
local qh_tab = {}
for k, v in ipairs(config) do  --����ǿ����
    qh_tab[v.type] = qh_tab[v.type] or {}
    qh_tab[v.type][v.level] = qh_tab[v.type][v.level] or {}
    qh_tab[v.type][v.level] = {name=v.name,cost=v.cost,cgjl=v.cgjl,jiacheng=v.jiacheng,attribute=v.attribute,itemid=v.itemid}
end

for i = 1, qh_tab do
    print()
end