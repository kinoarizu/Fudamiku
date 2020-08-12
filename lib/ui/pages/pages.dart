import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fudamiku/bloc/bloc.dart';
import 'package:fudamiku/models/models.dart';
import 'package:fudamiku/services/services.dart';
import 'package:fudamiku/shared/shared.dart';
import 'package:fudamiku/ui/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

part 'wrapper.dart';
part 'splash_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'address_page.dart';
part 'main_page.dart';
part 'home_page.dart';
part 'food_detail_page.dart';
part 'checkout_page.dart';
part 'success_page.dart';
part 'order_page.dart';
part 'order_detail_page.dart';
