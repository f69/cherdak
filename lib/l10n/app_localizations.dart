import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'main'**
  String get main;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'gallery'**
  String get gallery;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'services'**
  String get services;

  /// No description provided for @authors.
  ///
  /// In en, this message translates to:
  /// **'authors'**
  String get authors;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'about'**
  String get about;

  /// No description provided for @blog.
  ///
  /// In en, this message translates to:
  /// **'blog'**
  String get blog;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get search;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'enter'**
  String get enter;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'register'**
  String get register;

  /// No description provided for @paintingsFromCategory.
  ///
  /// In en, this message translates to:
  /// **'paintings from category'**
  String get paintingsFromCategory;

  /// No description provided for @worksCount.
  ///
  /// In en, this message translates to:
  /// **'{count} works'**
  String worksCount(Object count);

  /// No description provided for @askPrice.
  ///
  /// In en, this message translates to:
  /// **'Ask price'**
  String get askPrice;

  /// No description provided for @writeAuthor.
  ///
  /// In en, this message translates to:
  /// **'Write author'**
  String get writeAuthor;

  /// No description provided for @workParams.
  ///
  /// In en, this message translates to:
  /// **'Work characteristics:'**
  String get workParams;

  /// No description provided for @workDescription.
  ///
  /// In en, this message translates to:
  /// **'Work description:'**
  String get workDescription;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @genre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get genre;

  /// No description provided for @technique.
  ///
  /// In en, this message translates to:
  /// **'Technique'**
  String get technique;

  /// No description provided for @place.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get place;

  /// No description provided for @place2.
  ///
  /// In en, this message translates to:
  /// **'Place:'**
  String get place2;

  /// No description provided for @authorWorks.
  ///
  /// In en, this message translates to:
  /// **'Author works'**
  String get authorWorks;

  /// No description provided for @authorOtherWorks.
  ///
  /// In en, this message translates to:
  /// **'Author other works'**
  String get authorOtherWorks;

  /// No description provided for @artGalleryIntro.
  ///
  /// In en, this message translates to:
  /// **'Browse thousands of original works from artists and craftsmen from around the world and buy pieces that will inspire you every day!'**
  String get artGalleryIntro;

  /// No description provided for @found.
  ///
  /// In en, this message translates to:
  /// **'Found'**
  String get found;

  /// No description provided for @sorting.
  ///
  /// In en, this message translates to:
  /// **'Sorting'**
  String get sorting;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @authorsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} authors'**
  String authorsCount(Object count);

  /// No description provided for @authorsPageIntro.
  ///
  /// In en, this message translates to:
  /// **'Discover new artists with Cherdak Dalí today! Visit the pages of promising and established artists, as well as emerging artists who have something to say to this world.'**
  String get authorsPageIntro;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating:'**
  String get rating;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Tel:'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email:'**
  String get email;

  /// No description provided for @aboutAuthor.
  ///
  /// In en, this message translates to:
  /// **'About author:'**
  String get aboutAuthor;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'To favorite'**
  String get favorite;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @servicePageIntro.
  ///
  /// In en, this message translates to:
  /// **'View examples of the authors\' works on the page of the selected service and order wall painting, sculpture, your portrait or a copy of paintings by famous masters.'**
  String get servicePageIntro;

  /// No description provided for @servicesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} services'**
  String servicesCount(Object count);

  /// No description provided for @aboutPageIntro.
  ///
  /// In en, this message translates to:
  /// **'Dali\'s Attic is a Belarusian project that was developed by the ilavista team in 2016. The platform allows artists to post their works for free.'**
  String get aboutPageIntro;

  /// No description provided for @ideaHeader.
  ///
  /// In en, this message translates to:
  /// **'How did the idea come about?'**
  String get ideaHeader;

  /// No description provided for @ideaText.
  ///
  /// In en, this message translates to:
  /// **'The idea for the project arose unexpectedly. Artem and Valeryan (founders of the ilavista company, programmer and marketer, respectively) were walking around Minsk and went to an exhibition on Oktyabrskaya Street - they saw the prices of the works and were a little surprised.\n\nWe decided to look for the cost on the Internet. No worthy platforms were found. There were only online stores selling printed paintings, a union of artists, or groups on social networks. The question arose, where to look for talented but not yet famous guys who are ready to make money from their creativity?'**
  String get ideaText;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service type'**
  String get serviceType;

  /// No description provided for @onlineGallery.
  ///
  /// In en, this message translates to:
  /// **'Online gallery'**
  String get onlineGallery;

  /// No description provided for @galleryPromo.
  ///
  /// In en, this message translates to:
  /// **'Go to the online gallery and get a daily dose of inspiration!'**
  String get galleryPromo;

  /// No description provided for @gotoGallery.
  ///
  /// In en, this message translates to:
  /// **'Go to gallery'**
  String get gotoGallery;

  /// No description provided for @sellWith.
  ///
  /// In en, this message translates to:
  /// **'Sell with'**
  String get sellWith;

  /// No description provided for @sellPromo.
  ///
  /// In en, this message translates to:
  /// **'Register and post your paintings and services absolutely free.'**
  String get sellPromo;

  /// No description provided for @doRegister.
  ///
  /// In en, this message translates to:
  /// **'register'**
  String get doRegister;

  /// No description provided for @cherdakMain.
  ///
  /// In en, this message translates to:
  /// **'Cherdak Dalí is your guide to the world of art. We use a combination of technology and traditional knowledge to help those looking for art for any space.\n\nWhether you are simply interested in art or are a seasoned collector, we are here to shine a light on the most exciting, talented and culturally significant artists of our time.'**
  String get cherdakMain;

  /// No description provided for @inspirational.
  ///
  /// In en, this message translates to:
  /// **'inspirational'**
  String get inspirational;

  /// No description provided for @art.
  ///
  /// In en, this message translates to:
  /// **'art'**
  String get art;

  /// No description provided for @moreAboutUs.
  ///
  /// In en, this message translates to:
  /// **'More about us'**
  String get moreAboutUs;

  /// No description provided for @implementationHeader.
  ///
  /// In en, this message translates to:
  /// **'product implementation'**
  String get implementationHeader;

  /// No description provided for @implementationText.
  ///
  /// In en, this message translates to:
  /// **'From the idea to the implementation of the first version of the product it took 2-3 weeks. The popularity of the project quickly grew: “In a week, 50 authors registered 250 works. The project first appeared on the Internet in 2016.\n\nDali\'s Attic took part in competitions: My Business from ONT, BizTech BSU StartUp, 76th Startup Battle from startup.network, and Investor Day from Startup School We also introduced the project to art galleries, museums and art spaces that still support us. We were especially pleasantly greeted at BGAI, because many of the users are current, past or future students.'**
  String get implementationText;

  /// No description provided for @implementationText2.
  ///
  /// In en, this message translates to:
  /// **'* This was perhaps our best decision, since by presenting the project to the public we received a huge amount of feedback, comments, and suggestions from talented entrepreneurs, specialists and professionals.'**
  String get implementationText2;

  /// No description provided for @painting.
  ///
  /// In en, this message translates to:
  /// **'Painting'**
  String get painting;

  /// No description provided for @graphics.
  ///
  /// In en, this message translates to:
  /// **'Graphics'**
  String get graphics;

  /// No description provided for @handMade.
  ///
  /// In en, this message translates to:
  /// **'HandMade'**
  String get handMade;

  /// No description provided for @sketch.
  ///
  /// In en, this message translates to:
  /// **'Sketch'**
  String get sketch;

  /// No description provided for @sculpture.
  ///
  /// In en, this message translates to:
  /// **'Sculpture'**
  String get sculpture;

  /// No description provided for @portrait.
  ///
  /// In en, this message translates to:
  /// **'Portrait to order'**
  String get portrait;

  /// No description provided for @paint.
  ///
  /// In en, this message translates to:
  /// **'Painting to order'**
  String get paint;

  /// No description provided for @wall_painting.
  ///
  /// In en, this message translates to:
  /// **'Wall painting'**
  String get wall_painting;

  /// No description provided for @picture_from_photo.
  ///
  /// In en, this message translates to:
  /// **'Painting from a photograph'**
  String get picture_from_photo;

  /// No description provided for @statue.
  ///
  /// In en, this message translates to:
  /// **'Custom statue'**
  String get statue;

  /// No description provided for @handmade_toys.
  ///
  /// In en, this message translates to:
  /// **'Handmade toys'**
  String get handmade_toys;

  /// No description provided for @handmade_souvenirs.
  ///
  /// In en, this message translates to:
  /// **'Handmade souvenirs'**
  String get handmade_souvenirs;

  /// No description provided for @forging.
  ///
  /// In en, this message translates to:
  /// **'Forging to order'**
  String get forging;

  /// No description provided for @leather.
  ///
  /// In en, this message translates to:
  /// **'Leather products'**
  String get leather;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
