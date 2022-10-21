Item = {}

--���idx�Ƿ��ǻ���
function Item.isCurrency(idx)
    local stdmode = lib996:getstditeminfo(idx, ConstCfg.stditeminfo.stdmode)
    return stdmode == 41
end

--���idx�Ƿ�����Ʒ
function Item.isItem(idx)
    local stdmode = lib996:getstditeminfo(idx, ConstCfg.stditeminfo.stdmode)
    if stdmode == 41 then return end
    return not ConstCfg.stdmodewheremap[stdmode]
end

--���idx�Ƿ���װ��
function Item.isEquip(idx)
    local stdmode = lib996:getstditeminfo(idx, ConstCfg.stditeminfo.stdmode)
    if stdmode == 41 then return end
    return ConstCfg.stdmodewheremap[stdmode]
end

--��ȡwhereͨ��idx
function Item.getWheresByIdx(idx)
    local stdmode = lib996:getstditeminfo(idx, ConstCfg.stditeminfo.stdmode)
    return ConstCfg.stdmodewheremap[stdmode]
end

--��ȡidxͨ��where
function Item.getIdxByWhere(actor, where)
    local equipobj = linkbodyitem(actor, where)
    if equipobj == "0" then return end
    return lib996:getiteminfo(actor, equipobj, ConstCfg.iteminfo.idx)
end

--��ȡ��Ʒ����ͨ��idx
function Item.getNameByIdx(idx)
    if idx == ConstCfg.money.bdjade then
        return "���"
    end
    return lib996:getstditeminfo(idx, ConstCfg.stditeminfo.name)
end

return Item