// Generated by gencpp from file drone_controller/Error.msg
// DO NOT EDIT!


#ifndef DRONE_CONTROLLER_MESSAGE_ERROR_H
#define DRONE_CONTROLLER_MESSAGE_ERROR_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace drone_controller
{
template <class ContainerAllocator>
struct Error_
{
  typedef Error_<ContainerAllocator> Type;

  Error_()
    : errorX(0.0)
    , errorY(0.0)
    , errorT(0.0)
    , errorS(0.0)  {
    }
  Error_(const ContainerAllocator& _alloc)
    : errorX(0.0)
    , errorY(0.0)
    , errorT(0.0)
    , errorS(0.0)  {
  (void)_alloc;
    }



   typedef float _errorX_type;
  _errorX_type errorX;

   typedef float _errorY_type;
  _errorY_type errorY;

   typedef float _errorT_type;
  _errorT_type errorT;

   typedef float _errorS_type;
  _errorS_type errorS;





  typedef boost::shared_ptr< ::drone_controller::Error_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::drone_controller::Error_<ContainerAllocator> const> ConstPtr;

}; // struct Error_

typedef ::drone_controller::Error_<std::allocator<void> > Error;

typedef boost::shared_ptr< ::drone_controller::Error > ErrorPtr;
typedef boost::shared_ptr< ::drone_controller::Error const> ErrorConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::drone_controller::Error_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::drone_controller::Error_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::drone_controller::Error_<ContainerAllocator1> & lhs, const ::drone_controller::Error_<ContainerAllocator2> & rhs)
{
  return lhs.errorX == rhs.errorX &&
    lhs.errorY == rhs.errorY &&
    lhs.errorT == rhs.errorT &&
    lhs.errorS == rhs.errorS;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::drone_controller::Error_<ContainerAllocator1> & lhs, const ::drone_controller::Error_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace drone_controller

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::drone_controller::Error_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::drone_controller::Error_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drone_controller::Error_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drone_controller::Error_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drone_controller::Error_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drone_controller::Error_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::drone_controller::Error_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bec471dc6cd71b2bc7e4ca773e16f190";
  }

  static const char* value(const ::drone_controller::Error_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbec471dc6cd71b2bULL;
  static const uint64_t static_value2 = 0xc7e4ca773e16f190ULL;
};

template<class ContainerAllocator>
struct DataType< ::drone_controller::Error_<ContainerAllocator> >
{
  static const char* value()
  {
    return "drone_controller/Error";
  }

  static const char* value(const ::drone_controller::Error_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::drone_controller::Error_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 errorX\n"
"float32 errorY\n"
"float32 errorT\n"
"float32 errorS\n"
"\n"
"\n"
;
  }

  static const char* value(const ::drone_controller::Error_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::drone_controller::Error_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.errorX);
      stream.next(m.errorY);
      stream.next(m.errorT);
      stream.next(m.errorS);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Error_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::drone_controller::Error_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::drone_controller::Error_<ContainerAllocator>& v)
  {
    s << indent << "errorX: ";
    Printer<float>::stream(s, indent + "  ", v.errorX);
    s << indent << "errorY: ";
    Printer<float>::stream(s, indent + "  ", v.errorY);
    s << indent << "errorT: ";
    Printer<float>::stream(s, indent + "  ", v.errorT);
    s << indent << "errorS: ";
    Printer<float>::stream(s, indent + "  ", v.errorS);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DRONE_CONTROLLER_MESSAGE_ERROR_H