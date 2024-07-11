// Generated by gencpp from file drone_controller/controllerRequest.msg
// DO NOT EDIT!


#ifndef DRONE_CONTROLLER_MESSAGE_CONTROLLERREQUEST_H
#define DRONE_CONTROLLER_MESSAGE_CONTROLLERREQUEST_H


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
struct controllerRequest_
{
  typedef controllerRequest_<ContainerAllocator> Type;

  controllerRequest_()
    : activate(false)  {
    }
  controllerRequest_(const ContainerAllocator& _alloc)
    : activate(false)  {
  (void)_alloc;
    }



   typedef uint8_t _activate_type;
  _activate_type activate;





  typedef boost::shared_ptr< ::drone_controller::controllerRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::drone_controller::controllerRequest_<ContainerAllocator> const> ConstPtr;

}; // struct controllerRequest_

typedef ::drone_controller::controllerRequest_<std::allocator<void> > controllerRequest;

typedef boost::shared_ptr< ::drone_controller::controllerRequest > controllerRequestPtr;
typedef boost::shared_ptr< ::drone_controller::controllerRequest const> controllerRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::drone_controller::controllerRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::drone_controller::controllerRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::drone_controller::controllerRequest_<ContainerAllocator1> & lhs, const ::drone_controller::controllerRequest_<ContainerAllocator2> & rhs)
{
  return lhs.activate == rhs.activate;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::drone_controller::controllerRequest_<ContainerAllocator1> & lhs, const ::drone_controller::controllerRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace drone_controller

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::drone_controller::controllerRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::drone_controller::controllerRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drone_controller::controllerRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::drone_controller::controllerRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drone_controller::controllerRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::drone_controller::controllerRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::drone_controller::controllerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b15627a984ebdd591b2ee87ce75c4d06";
  }

  static const char* value(const ::drone_controller::controllerRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb15627a984ebdd59ULL;
  static const uint64_t static_value2 = 0x1b2ee87ce75c4d06ULL;
};

template<class ContainerAllocator>
struct DataType< ::drone_controller::controllerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "drone_controller/controllerRequest";
  }

  static const char* value(const ::drone_controller::controllerRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::drone_controller::controllerRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool activate  # Whether to activate or deactivate the controller\n"
;
  }

  static const char* value(const ::drone_controller::controllerRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::drone_controller::controllerRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.activate);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct controllerRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::drone_controller::controllerRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::drone_controller::controllerRequest_<ContainerAllocator>& v)
  {
    s << indent << "activate: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.activate);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DRONE_CONTROLLER_MESSAGE_CONTROLLERREQUEST_H
