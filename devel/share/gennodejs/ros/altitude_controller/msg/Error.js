// Auto-generated. Do not edit!

// (in-package altitude_controller.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Error {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.errorX = null;
      this.errorY = null;
      this.errorT = null;
      this.errorZ = null;
    }
    else {
      if (initObj.hasOwnProperty('errorX')) {
        this.errorX = initObj.errorX
      }
      else {
        this.errorX = 0.0;
      }
      if (initObj.hasOwnProperty('errorY')) {
        this.errorY = initObj.errorY
      }
      else {
        this.errorY = 0.0;
      }
      if (initObj.hasOwnProperty('errorT')) {
        this.errorT = initObj.errorT
      }
      else {
        this.errorT = 0.0;
      }
      if (initObj.hasOwnProperty('errorZ')) {
        this.errorZ = initObj.errorZ
      }
      else {
        this.errorZ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Error
    // Serialize message field [errorX]
    bufferOffset = _serializer.float32(obj.errorX, buffer, bufferOffset);
    // Serialize message field [errorY]
    bufferOffset = _serializer.float32(obj.errorY, buffer, bufferOffset);
    // Serialize message field [errorT]
    bufferOffset = _serializer.float32(obj.errorT, buffer, bufferOffset);
    // Serialize message field [errorZ]
    bufferOffset = _serializer.float32(obj.errorZ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Error
    let len;
    let data = new Error(null);
    // Deserialize message field [errorX]
    data.errorX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [errorY]
    data.errorY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [errorT]
    data.errorT = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [errorZ]
    data.errorZ = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'altitude_controller/Error';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '02b23bb72f5cb40fc5320fa3bb6465eb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 errorX
    float32 errorY
    float32 errorT
    float32 errorZ
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Error(null);
    if (msg.errorX !== undefined) {
      resolved.errorX = msg.errorX;
    }
    else {
      resolved.errorX = 0.0
    }

    if (msg.errorY !== undefined) {
      resolved.errorY = msg.errorY;
    }
    else {
      resolved.errorY = 0.0
    }

    if (msg.errorT !== undefined) {
      resolved.errorT = msg.errorT;
    }
    else {
      resolved.errorT = 0.0
    }

    if (msg.errorZ !== undefined) {
      resolved.errorZ = msg.errorZ;
    }
    else {
      resolved.errorZ = 0.0
    }

    return resolved;
    }
};

module.exports = Error;
