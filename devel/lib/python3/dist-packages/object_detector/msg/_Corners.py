# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from object_detector/Corners.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Corners(genpy.Message):
  _md5sum = "95a9b5efd4b7dca1a4966428500c815c"
  _type = "object_detector/Corners"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32 TopLeftX
float32 TopLeftY
float32 TopRightX
float32 TopRightY
float32 BottomLeftX
float32 BottomLeftY
float32 BottomRightX
float32 BottomRightY
float32 CenterX
float32 CenterY
"""
  __slots__ = ['TopLeftX','TopLeftY','TopRightX','TopRightY','BottomLeftX','BottomLeftY','BottomRightX','BottomRightY','CenterX','CenterY']
  _slot_types = ['float32','float32','float32','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       TopLeftX,TopLeftY,TopRightX,TopRightY,BottomLeftX,BottomLeftY,BottomRightX,BottomRightY,CenterX,CenterY

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Corners, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.TopLeftX is None:
        self.TopLeftX = 0.
      if self.TopLeftY is None:
        self.TopLeftY = 0.
      if self.TopRightX is None:
        self.TopRightX = 0.
      if self.TopRightY is None:
        self.TopRightY = 0.
      if self.BottomLeftX is None:
        self.BottomLeftX = 0.
      if self.BottomLeftY is None:
        self.BottomLeftY = 0.
      if self.BottomRightX is None:
        self.BottomRightX = 0.
      if self.BottomRightY is None:
        self.BottomRightY = 0.
      if self.CenterX is None:
        self.CenterX = 0.
      if self.CenterY is None:
        self.CenterY = 0.
    else:
      self.TopLeftX = 0.
      self.TopLeftY = 0.
      self.TopRightX = 0.
      self.TopRightY = 0.
      self.BottomLeftX = 0.
      self.BottomLeftY = 0.
      self.BottomRightX = 0.
      self.BottomRightY = 0.
      self.CenterX = 0.
      self.CenterY = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_10f().pack(_x.TopLeftX, _x.TopLeftY, _x.TopRightX, _x.TopRightY, _x.BottomLeftX, _x.BottomLeftY, _x.BottomRightX, _x.BottomRightY, _x.CenterX, _x.CenterY))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 40
      (_x.TopLeftX, _x.TopLeftY, _x.TopRightX, _x.TopRightY, _x.BottomLeftX, _x.BottomLeftY, _x.BottomRightX, _x.BottomRightY, _x.CenterX, _x.CenterY,) = _get_struct_10f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_10f().pack(_x.TopLeftX, _x.TopLeftY, _x.TopRightX, _x.TopRightY, _x.BottomLeftX, _x.BottomLeftY, _x.BottomRightX, _x.BottomRightY, _x.CenterX, _x.CenterY))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 40
      (_x.TopLeftX, _x.TopLeftY, _x.TopRightX, _x.TopRightY, _x.BottomLeftX, _x.BottomLeftY, _x.BottomRightX, _x.BottomRightY, _x.CenterX, _x.CenterY,) = _get_struct_10f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_10f = None
def _get_struct_10f():
    global _struct_10f
    if _struct_10f is None:
        _struct_10f = struct.Struct("<10f")
    return _struct_10f
