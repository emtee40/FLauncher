/*
 * FLauncher
 * Copyright (C) 2021  Étienne Fesser
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientPanelPage extends StatelessWidget {
  static const String routeName = "gradient_panel";

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text("Gradient", style: Theme.of(context).textTheme.headline6),
          Divider(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4 / 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                _gradientCard(
                  "Saint Petersburg",
                  LinearGradient(colors: [Color(0xFFF5F7FA), Color(0xFFC3CFE2)], transform: GradientRotation(7)),
                ),
                _gradientCard(
                  "Old Hat",
                  RadialGradient(colors: [Color(0xFFFCB69F), Color(0xFFFFECD2)]),
                ),
                _gradientCard(
                  "Great Whale",
                  LinearGradient(colors: [Color(0xFF6991C7), Color(0xFFA3BDED)], transform: GradientRotation(5.6)),
                ),
                _gradientCard(
                  "Teen Notebook",
                  LinearGradient(colors: [Color(0xFF9795F0), Color(0xFFFBC8D4)], transform: GradientRotation(pi / 2)),
                ),
                _gradientCard(
                  "Burning Spring",
                  RadialGradient(colors: [Color(0xFF71DDA6), Color(0xFF70B2BC)]),
                ),
                _gradientCard(
                  "Desert Hump",
                  LinearGradient(colors: [Color(0xFFC79081), Color(0xFFDFA579)], transform: GradientRotation(pi / 2)),
                ),
                _gradientCard(
                  "Faraway River",
                  LinearGradient(colors: [Color(0xFF6E45E2), Color(0xFF88D3CE)], transform: GradientRotation(7.5)),
                ),
                _gradientCard(
                  "Vicious Stance",
                  LinearGradient(colors: [Color(0xFF29323C), Color(0xFF485563)], transform: GradientRotation(1.6)),
                ),
                _gradientCard(
                  "African Field",
                  LinearGradient(colors: [Color(0xFFFF6B95), Color(0xFFFFC796)], transform: GradientRotation(2.3)),
                ),
                _gradientCard(
                  "Grass Shampoo",
                  LinearGradient(
                    colors: [Color(0xFF39F3BB), Color(0xFF90F9C4), Color(0xFFDFFFCD)],
                    stops: [0, 0.47, 1],
                    transform: GradientRotation(5.5),
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget _gradientCard(String name, Gradient gradient) => Focus(
        canRequestFocus: false,
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: _cardBorder(Focus.of(context).hasFocus),
                  child: InkWell(
                    onTap: () => {}, // context.read<WallpaperService>().setGradient(),
                    child: Container(decoration: BoxDecoration(gradient: gradient)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.caption!.copyWith(decoration: TextDecoration.underline),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );

  ShapeBorder? _cardBorder(bool hasFocus) => hasFocus
      ? RoundedRectangleBorder(side: BorderSide(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(4))
      : null;
}
