// Auto-generated. Do not edit!

// (in-package object_detector.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Corners {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.TopLeftX = null;
      this.TopLeftY = null;
      this.TopRightX = null;
      this.TopRightY = null;
      this.BottomLeftX = null;
      this.BottomLeftY = null;
      this.BottomRightX = null;
      this.BottomRightY = null;
      this.CenterX = null;
      this.CenterY = null;
    }
    else {
      if (initObj.hasOwnProperty('TopLeftX')) {
        this.TopLeftX = initObj.TopLeftX
      }
      else {
        this.TopLeftX = 0.0;
      }
      if (initObj.hasOwnProperty('TopLeftY')) {
        this.TopLeftY = initObj.TopLeftY
      }
      else {
        this.TopLeftY = 0.0;
      }
      if (initObj.hasOwnProperty('TopRightX')) {
        this.TopRightX = initObj.TopRightX
      }
      else {
        this.TopRightX = 0.0;
      }
      if (initObj.hasOwnProperty('TopRightY')) {
        this.TopRightY = initObj.TopRightY
      }
      else {
        this.TopRightY = 0.0;
      }
      if (initObj.hasOwnProperty('BottomLeftX')) {
        this.BottomLeftX = initObj.BottomLeftX
      }
      else {
        this.BottomLeftX = 0.0;
      }
      if (initObj.hasOwnProperty('BottomLeftY')) {
        this.BottomLeftY = initObj.BottomLeftY
      }
      else {
        this.BottomLeftY = 0.0;
      }
      if (initObj.hasOwnProperty('BottomRightX')) {
        this.BottomRightX = initObj.BottomRightX
      }
      else {
        this.BottomRightX = 0.0;
      }
      if (initObj.hasOwnProperty('BottomRightY')) {
        this.BottomRightY = initObj.BottomRightY
      }
      else {
        this.BottomRightY = 0.0;
      }
      if (initObj.hasOwnProperty('CenterX')) {
        this.CenterX = initObj.CenterX
      }
      else {
        this.CenterX = 0.0;
      }
      if (initObj.hasOwnProperty('CenterY')) {
        this.CenterY = initObj.CenterY
      }
      else {
        this.CenterY = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Corners
    // Serialize message field [TopLeftX]
    bufferOffset = _serializer.float32(obj.TopLeftX, buffer, bufferOffset);
    // Serialize message field [TopLeftY]
    bufferOffset = _serializer.float32(obj.TopLeftY, buffer, bufferOffset);
    // Serialize message field [TopRightX]
    bufferOffset = _serializer.float32(obj.TopRightX, buffer, bufferOffset);
    // Serialize message field [TopRightY]
    bufferOffset = _serializer.float32(obj.TopRightY, buffer, bufferOffset);
    // Serialize message field [BottomLeftX]
    bufferOffset = _serializer.float32(obj.BottomLeftX, buffer, bufferOffset);
    // Serialize message field [BottomLeftY]
    bufferOffset = _serializer.float32(obj.BottomLeftY, buffer, bufferOffset);
    // Serialize message field [BottomRightX]
    bufferOffset = _serializer.float32(obj.BottomRightX, buffer, bufferOffset);
    // Serialize message field [BottomRightY]
    bufferOffset = _serializer.float32(obj.BottomRightY, buffer, bufferOffset);
    // Serialize message field [CenterX]
    bufferOffset = _serializer.float32(obj.CenterX, buffer, bufferOffset);
    // Serialize message field [CenterY]
    bufferOffset = _serializer.float32(obj.CenterY, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Corners
    let len;
    let data = new Corners(null);
    // Deserialize message field [TopLeftX]
    data.TopLeftX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [TopLeftY]
    data.TopLeftY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [TopRightX]
    data.TopRightX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [TopRightY]
    data.TopRightY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [BottomLeftX]
    data.BottomLeftX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [BottomLeftY]
    data.BottomLeftY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [BottomRightX]
    data.BottomRightX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [BottomRightY]
    data.BottomRightY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [CenterX]
    data.CenterX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [CenterY]
    data.CenterY = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'object_detector/Corners';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95a9b5efd4b7dca1a4966428500c815c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 TopLeftX
    float32 TopLeftY
    float32 TopRightX
    float32 TopRightY
    float32 BottomLeftX
    float32 BottomLeftY
    float32 BottomRightX
    float32 BottomRightY
    float32 CenterX
    float32 CenterY
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Corners(null);
    if (msg.TopLeftX !== undefined) {
      resolved.TopLeftX = msg.TopLeftX;
    }
    else {
      resolved.TopLeftX = 0.0
    }

    if (msg.TopLeftY !== undefined) {
      resolved.TopLeftY = msg.TopLeftY;
    }
    else {
      resolved.TopLeftY = 0.0
    }

    if (msg.TopRightX !== undefined) {
      resolved.TopRightX = msg.TopRightX;
    }
    else {
      resolved.TopRightX = 0.0
    }

    if (msg.TopRightY !== undefined) {
      resolved.TopRightY = msg.TopRightY;
    }
    else {
      resolved.TopRightY = 0.0
    }

    if (msg.BottomLeftX !== undefined) {
      resolved.BottomLeftX = msg.BottomLeftX;
    }
    else {
      resolved.BottomLeftX = 0.0
    }

    if (msg.BottomLeftY !== undefined) {
      resolved.BottomLeftY = msg.BottomLeftY;
    }
    else {
      resolved.BottomLeftY = 0.0
    }

    if (msg.BottomRightX !== undefined) {
      resolved.BottomRightX = msg.BottomRightX;
    }
    else {
      resolved.BottomRightX = 0.0
    }

    if (msg.BottomRightY !== undefined) {
      resolved.BottomRightY = msg.BottomRightY;
    }
    else {
      resolved.BottomRightY = 0.0
    }

    if (msg.CenterX !== undefined) {
      resolved.CenterX = msg.CenterX;
    }
    else {
      resolved.CenterX = 0.0
    }

    if (msg.CenterY !== undefined) {
      resolved.CenterY = msg.CenterY;
    }
    else {
      resolved.CenterY = 0.0
    }

    return resolved;
    }
};

module.exports = Corners;
