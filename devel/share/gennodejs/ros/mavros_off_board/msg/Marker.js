// Auto-generated. Do not edit!

// (in-package mavros_off_board.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Marker {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.marker = null;
    }
    else {
      if (initObj.hasOwnProperty('marker')) {
        this.marker = initObj.marker
      }
      else {
        this.marker = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Marker
    // Serialize message field [marker]
    bufferOffset = _serializer.string(obj.marker, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Marker
    let len;
    let data = new Marker(null);
    // Deserialize message field [marker]
    data.marker = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.marker);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mavros_off_board/Marker';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ccfec723a81cad4a14447f57eb95ca7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string marker
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Marker(null);
    if (msg.marker !== undefined) {
      resolved.marker = msg.marker;
    }
    else {
      resolved.marker = ''
    }

    return resolved;
    }
};

module.exports = Marker;
