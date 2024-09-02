enum ConnectionType {
  wifi,
  mobile,
}

enum BottomSheetInitialPage { cart, product, address }



enum DataState { initial, loading, success, failure }

enum SortType {
  relevance,
  priceLowToHigh,
  priceHighToLow,
  topRated,
  discountHigh
}

enum AttributeType { color, image, size }

enum PickImageType { camera, gallery }





enum PagingListViewType { listView, gridView }

enum OfferType {
  singleBanner,
  fullBanner,
  halfBanner,
  flashSale,
}

enum SlideDirection {
  Down,
  Up,
}

enum RecentType { product, brand, text, empty }

enum MimeType { video, image, none }

enum LoadState { loading, success, failure }

enum PostType {
  post,
  comment,
  replies,
}

enum TermsType { app, bank }

enum CollabRequestStatus {
  rejected,
  accepted,
  pending,
  delivered,
  collaborated
}
// makup booking
enum ServiceType { package, course }
enum ContactDetailsType { sameAsProfile, other }
enum PaymentType { full, partial }
enum MakeupBottomSheetInitialPage { packageDesc, dateBooking, paymentScreen,classBooking }
enum BookingMode {booking,payment}