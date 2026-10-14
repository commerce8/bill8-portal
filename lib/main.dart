// SPDX-FileCopyrightText: Copyright Logically Magic Inc. <hello@logicallymagic.com>
// SPDX-FileCopyrightText: Copyright Hamid Jahanzad <Hamid@Jahanzad.com>
// SPDX-FileCopyrightText: Copyright Contributors to the Bill8:Portal
// SPDX-License-Identifier: Apache-2.0

// Bill8:Portal — main entry point.
//
// The customer-facing billing portal: invoices, subscriptions, and
// payment methods. All API traffic routes through BffApiClient →
// Sentin8:BFF /proxy/billing/... and /proxy/payments/... (the platform
// BFF pattern — tokens never reach the client).

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:sentin8/sentin8.dart';
import 'pages/invoices_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Semantics for e2e/Playwright ARIA access.
  SemanticsBinding.instance.ensureSemantics();
  runApp(const PortalApp());
}

/// Root widget — resolves the runtime context, then the invoice list.
class PortalApp extends StatelessWidget {
  const PortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bill8 Portal',
      debugShowCheckedModeBanner: false,
      theme: sentin8Theme(),
      home: const InvoicesPage(),
    );
  }
}