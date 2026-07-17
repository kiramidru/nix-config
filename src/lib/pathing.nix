{ lib }:
{
  flatten =
    attrSets:
    let
      setList = if builtins.isList attrSets then attrSets else [ attrSets ];

      harvest = attrSet: lib.collect builtins.isPath attrSet;
    in
    lib.concatMap harvest setList;
}
