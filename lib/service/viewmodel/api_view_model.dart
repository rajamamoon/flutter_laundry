import 'package:whitedrywash/model/drywash/dry_wash_item.dart';
import 'package:whitedrywash/model/drywash/dry_wash_response.dart';
import 'package:whitedrywash/model/order/current_order_response.dart';
import 'package:whitedrywash/model/order/past_order_response.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_master.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';

getCurrentOrder() => <CurrentOrderResponse>[
  CurrentOrderResponse(orderId: '1', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: 'Order Date', deliveryDate: 'Delivery Date'),
  CurrentOrderResponse(orderId: '2', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  CurrentOrderResponse(orderId: '3', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  CurrentOrderResponse(orderId: '4', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  CurrentOrderResponse(orderId: '5', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  CurrentOrderResponse(orderId: '6', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  CurrentOrderResponse(orderId: '7', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  CurrentOrderResponse(orderId: '8', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  CurrentOrderResponse(orderId: '9', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop obile',  deliveryAddress: 'Delivery address', orderAmount: '1200', payAmount: '600', orderType: 'Fast', orderStatus: 'Process', orderDate: '00-00-0000', deliveryDate: '00-00-0000')
];

getPastOrder() => <PastOrderResponse>[
  PastOrderResponse(orderId: '1', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', orderType: 'Fast', orderStatus: 'Complete', orderDate: 'Order Date', deliveryDate: 'Delivery Date'),
  PastOrderResponse(orderId: '2', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', orderType: 'Fast', orderStatus: 'Complete', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  PastOrderResponse(orderId: '3', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', orderType: 'Fast', orderStatus: 'Complete', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  PastOrderResponse(orderId: '4', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', orderType: 'Fast', orderStatus: 'Complete', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
  PastOrderResponse(orderId: '5', shopName: 'Shop name', shopAddress: 'Shop address', shopMobileNo: 'Shop mobile', deliveryAddress: 'Delivery address', orderAmount: '1200', orderType: 'Fast', orderStatus: 'Complete', orderDate: '00-00-0000', deliveryDate: '00-00-0000'),
];


List<DryWashResponse> getDryWash() {
  List<DryWashResponse> dryWashList = List();

  List<DryWashItem> dryWashMenItem, dryWashWomenItem, dryWashKidsItem, dryWashHomeItem;
  dryWashMenItem = List();
  dryWashKidsItem = List();
  dryWashWomenItem = List();
  dryWashHomeItem = List();

  dryWashMenItem.add(DryWashItem(id: 1, name: 'Pant'));
  dryWashMenItem.add(DryWashItem(id: 2, name: 'Shirt'));
  dryWashMenItem.add(DryWashItem(id: 3, name: 'Dhoti'));
  dryWashMenItem.add(DryWashItem(id: 4, name: 'Pancha'));
  dryWashMenItem.add(DryWashItem(id: 5, name: 'Sherwani'));
  dryWashMenItem.add(DryWashItem(id: 6, name: 'Blazer'));
  dryWashMenItem.add(DryWashItem(id: 7, name: 'T - Shirt'));
  dryWashMenItem.add(DryWashItem(id: 8, name: 'Kurta'));
  dryWashMenItem.add(DryWashItem(id: 9, name: 'Suit'));
  dryWashMenItem.add(DryWashItem(id: 10, name: 'Vest coat'));
  dryWashMenItem.add(DryWashItem(id: 11, name: 'Tie'));
  dryWashMenItem.add(DryWashItem(id: 12, name: 'Jerkin'));
  dryWashMenItem.add(DryWashItem(id: 13, name: 'Jacket'));
  dryWashMenItem.add(DryWashItem(id: 14, name: 'Jeans Pant'));
  dryWashMenItem.add(DryWashItem(id: 15, name: 'Kanduva'));

  dryWashKidsItem.add(DryWashItem(id: 16, name: 'Frock'));
  dryWashKidsItem.add(DryWashItem(id: 17, name: 'Lehenga'));
  dryWashKidsItem.add(DryWashItem(id: 18, name: 'T - Shirt'));
  dryWashKidsItem.add(DryWashItem(id: 19, name: 'Shirt'));
  dryWashKidsItem.add(DryWashItem(id: 20, name: 'Kurta'));
  dryWashKidsItem.add(DryWashItem(id: 21, name: 'Pyjama'));
  dryWashKidsItem.add(DryWashItem(id: 22, name: 'Sherwani'));
  dryWashKidsItem.add(DryWashItem(id: 23, name: 'Pant'));
  dryWashKidsItem.add(DryWashItem(id: 24, name: 'Jeans Pant'));
  dryWashKidsItem.add(DryWashItem(id: 25, name: 'Dhoti'));
  dryWashKidsItem.add(DryWashItem(id: 26, name: 'Kanduva'));
  dryWashKidsItem.add(DryWashItem(id: 27, name: 'Pancha'));
  dryWashKidsItem.add(DryWashItem(id: 28, name: 'Suit'));
  dryWashKidsItem.add(DryWashItem(id: 29, name: 'Blazer'));

  dryWashWomenItem.add(DryWashItem(id: 30, name: 'Saree'));
  dryWashWomenItem.add(DryWashItem(id: 31, name: 'Blouse'));
  dryWashWomenItem.add(DryWashItem(id: 32, name: 'Frock'));
  dryWashWomenItem.add(DryWashItem(id: 33, name: 'Top'));
  dryWashWomenItem.add(DryWashItem(id: 34, name: 'Lehenga'));
  dryWashWomenItem.add(DryWashItem(id: 35, name: 'Bottom'));
  dryWashWomenItem.add(DryWashItem(id: 36, name: 'Chuni'));
  dryWashWomenItem.add(DryWashItem(id: 37, name: 'Chagra'));
  dryWashWomenItem.add(DryWashItem(id: 39, name: 'Jeans Pant'));

  dryWashHomeItem.add(DryWashItem(id: 40, name: 'Bedsheet'));
  dryWashHomeItem.add(DryWashItem(id: 41, name: 'Blanket'));
  dryWashHomeItem.add(DryWashItem(id: 42, name: 'Comforter'));
  dryWashHomeItem.add(DryWashItem(id: 43, name: 'Carpet'));
  dryWashHomeItem.add(DryWashItem(id: 44, name: 'Towl'));
  dryWashHomeItem.add(DryWashItem(id: 45, name: 'Pillow'));
  dryWashHomeItem.add(DryWashItem(id: 46, name: 'Razai'));

  dryWashList.add(DryWashResponse(id: 1, dryWashItemList: dryWashMenItem, name: 'Men'));
  dryWashList.add(DryWashResponse(id: 2, dryWashItemList: dryWashWomenItem, name: 'Women'));
  dryWashList.add(DryWashResponse(id: 3, dryWashItemList: dryWashKidsItem, name: 'Kids'));
  dryWashList.add(DryWashResponse(id: 4, dryWashItemList: dryWashHomeItem, name: 'Home'));

  return dryWashList;
}

List<SelectWashShopResponse> getSelectWashShop() {
  List<SelectWashShopResponse> selectWashShopList = List();

  List<SelectWashMaster> selectWashMaster_1, selectWashMaster_2;
  selectWashMaster_1 = List();
  selectWashMaster_1.add(SelectWashMaster(shopId: 1, menuId: 1, menuName: 'Men', categoryName: 'Pant',  categoryId: 1, water: 10, price: 200, washShopStatus: true));
  selectWashMaster_1.add(SelectWashMaster(shopId: 1, menuId: 1, menuName: 'Men', categoryName: 'Shirt', categoryId: 2, water: 5, price: 100, washShopStatus: true));
  selectWashMaster_1.add(SelectWashMaster(shopId: 1, menuId: 1, menuName: 'Men', categoryName: 'Dhoti', categoryId: 3, water: 20, price: 400, washShopStatus: false));

  selectWashMaster_2 = List();
  selectWashMaster_2.add(SelectWashMaster(shopId: 2, menuId: 1, menuName: 'Men', categoryName: 'Pant',  categoryId: 1, water: 10, price: 100, washShopStatus: true));
  selectWashMaster_2.add(SelectWashMaster(shopId: 2, menuId: 1, menuName: 'Men', categoryName: 'Shirt', categoryId: 2, water: 5, price: 100, washShopStatus: true));
  selectWashMaster_2.add(SelectWashMaster(shopId: 2, menuId: 1, menuName: 'Men', categoryName: 'Dhoti', categoryId: 3, water: 20, price: 100, washShopStatus: true));

  selectWashShopList.add(SelectWashShopResponse(id: 1, city: 'Ahmedabad', area: 'Nikol', name: 'Chirag drycleaners', address: '25 Shreyance Park Society Pancham Mall Opposite Nikol Gam Road', selectWashMasterList: selectWashMaster_1));
  selectWashShopList.add(SelectWashShopResponse(id: 2, city: 'Ahmedabad', area: 'Nikol', name: 'Dharmendra Dry Cleaners & Petrol Wash', address: 'Shopping Center, Mama Kalyan Circle, 7, Nikol-Naroda Rd, Padmavatinagar Society, Nava Naroda', selectWashMasterList: selectWashMaster_2));
  selectWashShopList.add(SelectWashShopResponse(id: 2, city: 'Surat', area: 'Athwa', name: 'Green Clean Dry Cleaners', address: '2, City Light Rd, Panas Gam, City Light Town, Athwa', selectWashMasterList: selectWashMaster_2));


  return selectWashShopList;
}