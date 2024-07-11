// Generated by gencpp from file mavros_off_board/Marker.msg
// DO NOT EDIT!


#ifndef MAVROS_OFF_BOARD_MESSAGE_MARKER_H
#define MAVROS_OFF_BOARD_MESSAGE_MARKER_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mavros_off_board
{
template <class ContainerAllocator>
struct Marker_
{
  typedef Marker_<ContainerAllocator> Type;

  Marker_()
    : marker()  {
    }
  Marker_(const ContainerAllocator& _alloc)
    : marker(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _marker_type;
  _marker_type marker;





  typedef boost::shared_ptr< ::mavros_off_board::Marker_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mavros_off_board::Marker_<ContainerAllocator> const> ConstPtr;

}; // struct Marker_

typedef ::mavros_off_board::Marker_<std::allocator<void> > Marker;

typedef boost::shared_ptr< ::mavros_off_board::Marker > MarkerPtr;
typedef boost::shared_ptr< ::mavros_off_board::Marker const> MarkerConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mavros_off_board::Marker_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mavros_off_board::Marker_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mavros_off_board::Marker_<ContainerAllocator1> & lhs, const ::mavros_off_board::Marker_<ContainerAllocator2> & rhs)
{
  return lhs.marker == rhs.marker;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mavros_off_board::Marker_<ContainerAllocator1> & lhs, const ::mavros_off_board::Marker_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mavros_off_board

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mavros_off_board::Marker_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mavros_off_board::Marker_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mavros_off_board::Marker_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mavros_off_board::Marker_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mavros_off_board::Marker_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mavros_off_board::Marker_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mavros_off_board::Marker_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ccfec723a81cad4a14447f57eb95ca7f";
  }

  static const char* value(const ::mavros_off_board::Marker_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xccfec723a81cad4aULL;
  static const uint64_t static_value2 = 0x14447f57eb95ca7fULL;
};

template<class ContainerAllocator>
struct DataType< ::mavros_off_board::Marker_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mavros_off_board/Marker";
  }

  static const char* value(const ::mavros_off_board::Marker_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mavros_off_board::Marker_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string marker\n"
;
  }

  static const char* value(const ::mavros_off_board::Marker_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mavros_off_board::Marker_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.marker);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Marker_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mavros_off_board::Marker_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mavros_off_board::Marker_<ContainerAllocator>& v)
  {
    s << indent << "marker: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.marker);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAVROS_OFF_BOARD_MESSAGE_MARKER_H