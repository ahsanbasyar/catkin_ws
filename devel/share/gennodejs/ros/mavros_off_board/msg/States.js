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

class States {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Xc = null;
      this.Yc = null;
      this.W = null;
      this.H = null;
      this.Theta = null;
    }
    else {
      if (initObj.hasOwnProperty('Xc')) {
        this.Xc = initObj.Xc
      }
      else {
        this.Xc = 0.0;
      }
      if (initObj.hasOwnProperty('Yc')) {
        this.Yc = initObj.Yc
      }
      else {
        this.Yc = 0.0;
      }
      if (initObj.hasOwnProperty('W')) {
        this.W = initObj.W
      }
      else {
        this.W = 0.0;
      }
      if (initObj.hasOwnProperty('H')) {
        this.H = initObj.H
      }
      else {
        this.H = 0.0;
      }
      if (initObj.hasOwnProperty('Theta')) {
        this.Theta = initObj.Theta
      }
      else {
        this.Theta = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type States
    // Serialize message field [Xc]
    bufferOffset = _serializer.float32(obj.Xc, buffer, bufferOffset);
    // Serialize message field [Yc]
    bufferOffset = _serializer.float32(obj.Yc, buffer, bufferOffset);
    // Serialize message field [W]
    bufferOffset = _serializer.float32(obj.W, buffer, bufferOffset);
    // Serialize message field [H]
    bufferOffset = _serializer.float32(obj.H, buffer, bufferOffset);
    // Serialize message field [Theta]
    bufferOffset = _serializer.float32(obj.Theta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type States
    let len;
    let data = new States(null);
    // Deserialize message field [Xc]
    data.Xc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Yc]
    data.Yc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [W]
    data.W = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [H]
    data.H = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Theta]
    data.Theta = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mavros_off_board/States';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50a97e783d0bea6e7856b14f0401e6c9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Xc
    float32 Yc
    float32 W
    float32 H
    float32 Theta
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new States(null);
    if (msg.Xc !== undefined) {
      resolved.Xc = msg.Xc;
    }
    else {
      resolved.Xc = 0.0
    }

    if (msg.Yc !== undefined) {
      resolved.Yc = msg.Yc;
    }
    else {
      resolved.Yc = 0.0
    }

    if (msg.W !== undefined) {
      resolved.W = msg.W;
    }
    else {
      resolved.W = 0.0
    }

    if (msg.H !== undefined) {
      resolved.H = msg.H;
    }
    else {
      resolved.H = 0.0
    }

    if (msg.Theta !== undefined) {
      resolved.Theta = msg.Theta;
    }
    else {
      resolved.Theta = 0.0
    }

    return resolved;
    }
};

module.exports = States;
