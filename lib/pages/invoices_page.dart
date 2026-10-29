// SPDX-FileCopyrightText: Copyright Logically Magic Inc. <hello@logicallymagic.com>
// SPDX-FileCopyrightText: Copyright Hamid Jahanzad <Hamid@Jahanzad.com>
// SPDX-FileCopyrightText: Copyright Contributors to the Bill8:Portal
// SPDX-License-Identifier: Apache-2.0

// The invoices page - the customer's invoice list with status and
// pay-now actions.
//
// Invoices render from the billing service through the BFF proxy; the
// pay-now action charges the invoice through the payments service
// (idempotency-keyed server-side - billing DESIGN.md §6).

import 'package:flutter/material.dart';
import 'package:sentin8/sentin8.dart';

/// Invoice list page.
class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bill8 Portal')),
      body: ListView(
        padding: const EdgeInsets.all(Sentin8Spacing.lg),
        children: const [
          GlassPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your invoices', style: Sentin8Text.headlineMedium),
                SizedBox(height: Sentin8Spacing.sm),
                Text(
                  'Open, paid, and past-due invoices appear here. Pay-now '
                  'charges the invoice on file; the result reflects the '
                  'uniform error envelope on failure.',
                  style: Sentin8Text.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}