// Generated by gencpp from file object_detector/Corners.msg
// DO NOT EDIT!


#ifndef OBJECT_DETECTOR_MESSAGE_CORNERS_H
#define OBJECT_DETECTOR_MESSAGE_CORNERS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace object_detector
{
template <class ContainerAllocator>
struct Corners_
{
  typedef Corners_<ContainerAllocator> Type;

  Corners_()
    : TopLeftX(0.0)
    , TopLeftY(0.0)
    , TopRightX(0.0)
    , TopRightY(0.0)
    , BottomLeftX(0.0)
    , BottomLeftY(0.0)
    , BottomRightX(0.0)
    , BottomRightY(0.0)
    , CenterX(0.0)
    , CenterY(0.0)  {
    }
  Corners_(const ContainerAllocator& _alloc)
    : TopLeftX(0.0)
    , TopLeftY(0.0)
    , TopRightX(0.0)
    , TopRightY(0.0)
    , BottomLeftX(0.0)
    , BottomLeftY(0.0)
    , BottomRightX(0.0)
    , BottomRightY(0.0)
    , CenterX(0.0)
    , CenterY(0.0)  {
  (void)_alloc;
    }



   typedef float _TopLeftX_type;
  _TopLeftX_type TopLeftX;

   typedef float _TopLeftY_type;
  _TopLeftY_type TopLeftY;

   typedef float _TopRightX_type;
  _TopRightX_type TopRightX;

   typedef float _TopRightY_type;
  _TopRightY_type TopRightY;

   typedef float _BottomLeftX_type;
  _BottomLeftX_type BottomLeftX;

   typedef float _BottomLeftY_type;
  _BottomLeftY_type BottomLeftY;

   typedef float _BottomRightX_type;
  _BottomRightX_type BottomRightX;

   typedef float _BottomRightY_type;
  _BottomRightY_type BottomRightY;

   typedef float _CenterX_type;
  _CenterX_type CenterX;

   typedef float _CenterY_type;
  _CenterY_type CenterY;





  typedef boost::shared_ptr< ::object_detector::Corners_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::object_detector::Corners_<ContainerAllocator> const> ConstPtr;

}; // struct Corners_

typedef ::object_detector::Corners_<std::allocator<void> > Corners;

typedef boost::shared_ptr< ::object_detector::Corners > CornersPtr;
typedef boost::shared_ptr< ::object_detector::Corners const> CornersConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::object_detector::Corners_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::object_detector::Corners_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::object_detector::Corners_<ContainerAllocator1> & lhs, const ::object_detector::Corners_<ContainerAllocator2> & rhs)
{
  return lhs.TopLeftX == rhs.TopLeftX &&
    lhs.TopLeftY == rhs.TopLeftY &&
    lhs.TopRightX == rhs.TopRightX &&
    lhs.TopRightY == rhs.TopRightY &&
    lhs.BottomLeftX == rhs.BottomLeftX &&
    lhs.BottomLeftY == rhs.BottomLeftY &&
    lhs.BottomRightX == rhs.BottomRightX &&
    lhs.BottomRightY == rhs.BottomRightY &&
    lhs.CenterX == rhs.CenterX &&
    lhs.CenterY == rhs.CenterY;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::object_detector::Corners_<ContainerAllocator1> & lhs, const ::object_detector::Corners_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace object_detector

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::object_detector::Corners_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::object_detector::Corners_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::object_detector::Corners_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::object_detector::Corners_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::object_detector::Corners_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::object_detector::Corners_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::object_detector::Corners_<ContainerAllocator> >
{
  static const char* value()
  {
    return "95a9b5efd4b7dca1a4966428500c815c";
  }

  static const char* value(const ::object_detector::Corners_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x95a9b5efd4b7dca1ULL;
  static const uint64_t static_value2 = 0xa4966428500c815cULL;
};

template<class ContainerAllocator>
struct DataType< ::object_detector::Corners_<ContainerAllocator> >
{
  static const char* value()
  {
    return "object_detector/Corners";
  }

  static const char* value(const ::object_detector::Corners_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::object_detector::Corners_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 TopLeftX\n"
"float32 TopLeftY\n"
"float32 TopRightX\n"
"float32 TopRightY\n"
"float32 BottomLeftX\n"
"float32 BottomLeftY\n"
"float32 BottomRightX\n"
"float32 BottomRightY\n"
"float32 CenterX\n"
"float32 CenterY\n"
;
  }

  static const char* value(const ::object_detector::Corners_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::object_detector::Corners_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.TopLeftX);
      stream.next(m.TopLeftY);
      stream.next(m.TopRightX);
      stream.next(m.TopRightY);
      stream.next(m.BottomLeftX);
      stream.next(m.BottomLeftY);
      stream.next(m.BottomRightX);
      stream.next(m.BottomRightY);
      stream.next(m.CenterX);
      stream.next(m.CenterY);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Corners_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::object_detector::Corners_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::object_detector::Corners_<ContainerAllocator>& v)
  {
    s << indent << "TopLeftX: ";
    Printer<float>::stream(s, indent + "  ", v.TopLeftX);
    s << indent << "TopLeftY: ";
    Printer<float>::stream(s, indent + "  ", v.TopLeftY);
    s << indent << "TopRightX: ";
    Printer<float>::stream(s, indent + "  ", v.TopRightX);
    s << indent << "TopRightY: ";
    Printer<float>::stream(s, indent + "  ", v.TopRightY);
    s << indent << "BottomLeftX: ";
    Printer<float>::stream(s, indent + "  ", v.BottomLeftX);
    s << indent << "BottomLeftY: ";
    Printer<float>::stream(s, indent + "  ", v.BottomLeftY);
    s << indent << "BottomRightX: ";
    Printer<float>::stream(s, indent + "  ", v.BottomRightX);
    s << indent << "BottomRightY: ";
    Printer<float>::stream(s, indent + "  ", v.BottomRightY);
    s << indent << "CenterX: ";
    Printer<float>::stream(s, indent + "  ", v.CenterX);
    s << indent << "CenterY: ";
    Printer<float>::stream(s, indent + "  ", v.CenterY);
  }
};

} // namespace message_operations
} // namespace ros

#endif // OBJECT_DETECTOR_MESSAGE_CORNERS_H
