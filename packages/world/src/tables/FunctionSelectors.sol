// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

uint256 constant _tableId = uint256(bytes32(abi.encodePacked(bytes16(""), bytes16("funcSelectors"))));
uint256 constant FunctionSelectorsTableId = _tableId;

library FunctionSelectors {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.BYTES16;
    _schema[1] = SchemaType.BYTES16;
    _schema[2] = SchemaType.BYTES4;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES4;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](3);
    _fieldNames[0] = "namespace";
    _fieldNames[1] = "file";
    _fieldNames[2] = "systemFunctionSelector";
    return ("FunctionSelectors", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get namespace */
  function getNamespace(bytes4 functionSelector) internal view returns (bytes16 namespace) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 0);
    return (Bytes.slice16(_blob, 0));
  }

  /** Set namespace */
  function setNamespace(bytes4 functionSelector, bytes16 namespace) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    StoreSwitch.setField(_tableId, _primaryKeys, 0, abi.encodePacked((namespace)));
  }

  /** Get file */
  function getFile(bytes4 functionSelector) internal view returns (bytes16 file) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 1);
    return (Bytes.slice16(_blob, 0));
  }

  /** Set file */
  function setFile(bytes4 functionSelector, bytes16 file) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    StoreSwitch.setField(_tableId, _primaryKeys, 1, abi.encodePacked((file)));
  }

  /** Get systemFunctionSelector */
  function getSystemFunctionSelector(bytes4 functionSelector) internal view returns (bytes4 systemFunctionSelector) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    bytes memory _blob = StoreSwitch.getField(_tableId, _primaryKeys, 2);
    return (Bytes.slice4(_blob, 0));
  }

  /** Set systemFunctionSelector */
  function setSystemFunctionSelector(bytes4 functionSelector, bytes4 systemFunctionSelector) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    StoreSwitch.setField(_tableId, _primaryKeys, 2, abi.encodePacked((systemFunctionSelector)));
  }

  /** Get the full data */
  function get(
    bytes4 functionSelector
  ) internal view returns (bytes16 namespace, bytes16 file, bytes4 systemFunctionSelector) {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _primaryKeys, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes4 functionSelector, bytes16 namespace, bytes16 file, bytes4 systemFunctionSelector) internal {
    bytes memory _data = encode(namespace, file, systemFunctionSelector);

    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    StoreSwitch.setRecord(_tableId, _primaryKeys, _data);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(
    bytes memory _blob
  ) internal pure returns (bytes16 namespace, bytes16 file, bytes4 systemFunctionSelector) {
    namespace = (Bytes.slice16(_blob, 0));

    file = (Bytes.slice16(_blob, 16));

    systemFunctionSelector = (Bytes.slice4(_blob, 32));
  }

  /** Tightly pack full data using this table's schema */
  function encode(bytes16 namespace, bytes16 file, bytes4 systemFunctionSelector) internal pure returns (bytes memory) {
    return abi.encodePacked(namespace, file, systemFunctionSelector);
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes4 functionSelector) internal {
    bytes32[] memory _primaryKeys = new bytes32[](1);
    _primaryKeys[0] = bytes32((functionSelector));

    StoreSwitch.deleteRecord(_tableId, _primaryKeys);
  }
}
