/// অ্যাপের সব বাংলা UI টেক্সট এক জায়গায়। কোনো widget-এ সরাসরি বাংলা
/// স্ট্রিং হার্ডকোড না করে এখান থেকে ব্যবহার করা হবে — এতে ভবিষ্যতে
/// টেক্সট পরিবর্তন বা অনুবাদ যোগ করা সহজ হবে।
class AppStrings {
  AppStrings._();

  // App
  static const String appName = 'বাকি খাতা';

  // Navigation / sections
  static const String dashboard = 'ড্যাশবোর্ড';
  static const String customers = 'গ্রাহক';
  static const String newCustomer = 'নতুন গ্রাহক';
  static const String settings = 'সেটিংস';
  static const String transactions = 'লেনদেন';
  static const String transactionHistory = 'লেনদেনের ইতিহাস';

  // Money / summary
  static const String due = 'বাকি';
  static const String paid = 'জমা';
  static const String totalDue = 'মোট পাওনা';
  static const String todayCollection = 'আজকের আদায়';
  static const String todayNewDebt = 'আজকের নতুন বাকি';
  static const String totalCustomers = 'মোট গ্রাহক';
  static const String currentDue = 'বর্তমান পাওনা';

  // Actions
  static const String newDebt = 'নতুন বাকি';
  static const String tookMoney = 'টাকা নিয়েছি';
  static const String save = 'সংরক্ষণ করুন';
  static const String cancel = 'বাতিল';
  static const String delete = 'মুছে ফেলুন';
  static const String edit = 'সম্পাদনা করুন';
  static const String search = 'সার্চ করুন';

  // Form fields
  static const String name = 'নাম';
  static const String phoneNumber = 'ফোন নম্বর';
  static const String address = 'ঠিকানা';
  static const String note = 'নোট';
  static const String amount = 'পরিমাণ';

  // Currency
  static const String currencySymbol = '৳';

  // States
  static const String loading = 'লোড হচ্ছে...';
  static const String noData = 'কোনো তথ্য পাওয়া যায়নি';
  static const String comingSoon = 'শীঘ্রই আসছে';

  // Confirmation
  static const String confirmDeleteTitle = 'নিশ্চিত করুন';
  static const String confirmDeleteMessage = 'আপনি কি নিশ্চিতভাবে মুছে ফেলতে চান?';
  static const String yes = 'হ্যাঁ';
  static const String no = 'না';

  // Errors
  static const String errorGeneric = 'কিছু একটা সমস্যা হয়েছে, আবার চেষ্টা করুন';
  static const String errorNameRequired = 'নাম দেওয়া আবশ্যক';
  static const String errorAmountInvalid = 'সঠিক পরিমাণ দিন';
}
