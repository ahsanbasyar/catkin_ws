// Auto-generated. Do not edit!

// (in-package drone_controller.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Information {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.information = null;
    }
    else {
      if (initObj.hasOwnProperty('information')) {
        this.information = initObj.information
      }
      else {
        this.information = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Information
    // Serialize message field [information]
    bufferOffset = _serializer.string(obj.information, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Information
    let len;
    let data = new Information(null);
    // Deserialize message field [information]
    data.information = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.information);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'drone_controller/Information';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8f643f4492d5df4a7264b4dfdbe3626f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string information
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Information(null);
    if (msg.information !== undefined) {
      resolved.information = msg.information;
    }
    else {
      resolved.information = ''
    }

    return resolved;
    }
};

module.exports = Information;
