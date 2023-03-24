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

import 'package:flauncher/providers/wallpaper_service.dart';
import 'package:flauncher/unsplash_service.dart';
import 'package:flauncher/widgets/ensure_visible.dart';
import 'package:flauncher/widgets/focus_keyboard_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UnsplashPanelPage extends StatelessWidget {
  static const String routeName = "unsplash_panel";

  const UnsplashPanelPage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Text("Unsplash", style: Theme.of(context).textTheme.titleLarge),
            const Divider(),
            Material(
              type: MaterialType.transparency,
              child: TabBar(
                tabs: [
                  Tab(child: Row(children: const [Icon(Icons.sync), SizedBox(width: 8), Text("Random")])),
                  Tab(child: Row(children: const [Icon(Icons.search), SizedBox(width: 8), Text("Search")])),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: TabBarView(children: [_RandomTab(), _SearchTab()])),
          ],
        ),
      );
}

class _RandomTab extends StatefulWidget {
  @override
  State<_RandomTab> createState() => _RandomTabState();
}

class _RandomTabState extends State<_RandomTab> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) => GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 16 / 9,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            _randomCard("Landscape", const AssetImage("assets/landscape.png"), autofocus: true),
            _randomCard("Abstract", const AssetImage("assets/abstract.png")),
            _randomCard("Minimal", const AssetImage("assets/minimal.png")),
            _randomCard("Texture", const AssetImage("assets/texture.png")),
            _randomCard("Architecture", const AssetImage("assets/architecture.png")),
            _randomCard("Plant", const AssetImage("assets/plant.png")),
            _randomCard("Technology", const AssetImage("assets/technology.png")),
            _randomCard("Animal", const AssetImage("assets/animal.png")),
            _randomCard("Colorful", const AssetImage("assets/colorful.png")),
            _randomCard("Space", const AssetImage("assets/space.png")),
          ]);

  Widget _randomCard(String text, AssetImage assetImage, {bool autofocus = false}) => Focus(
        canRequestFocus: false,
        child: Builder(
          builder: (context) => Stack(
            fit: StackFit.expand,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: _cardBorder(Focus.of(context).hasFocus),
                child: InkWell(
                  autofocus: autofocus,
                  onTap: () async {
                    if (enabled) {
                      setState(() => enabled = false);
                      try {
                        await context.read<WallpaperService>().randomFromUnsplash("${text.toLowerCase()} wallpaper");
                      } finally {
                        setState(() => enabled = true);
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Ink.image(
                          image: assetImage,
                          height: double.infinity,
                          width: 32,
                        ),
                        const SizedBox(width: 8),
                        Flexible(child: Text(text, overflow: TextOverflow.ellipsis))
                      ],
                    ),
                  ),
                ),
              ),
              if (!enabled && Focus.of(context).hasFocus) const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      );

  ShapeBorder? _cardBorder(bool hasFocus) => hasFocus
      ? RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(4))
      : null;
}

class _SearchTab extends StatefulWidget {
  @override
  State<_SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<_SearchTab> {
  bool enabled = true;
  List<Photo> _searchResults = [];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 16),
            child: FocusKeyboardListener(
              onPressed: (key) {
                if (key == LogicalKeyboardKey.arrowDown) {
                  FocusScope.of(context).nextFocus();
                  return KeyEventResult.handled;
                }
                if (key == LogicalKeyboardKey.arrowUp) {
                  FocusScope.of(context).previousFocus();
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              builder: (context) => TextField(
                decoration: const InputDecoration(labelText: "Search", isDense: true),
                keyboardType: TextInputType.text,
                onSubmitted: (value) async {
                  if (enabled) {
                    setState(() {
                      enabled = false;
                      _searchResults = [];
                    });
                    try {
                      final searchResults = await context.read<WallpaperService>().searchFromUnsplash(value);
                      setState(() => _searchResults = searchResults);
                    } finally {
                      setState(() => enabled = true);
                    }
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 16 / 11,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: _searchResults
                  .asMap()
                  .entries
                  .map((item) => EnsureVisible(alignment: 0.5, child: _searchResultCard(item.key, item.value)))
                  .toList(),
            ),
          ),
        ],
      );

  Widget _searchResultCard(int index, Photo photo) => Focus(
        canRequestFocus: false,
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: _cardBorder(Focus.of(context).hasFocus),
                      child: InkWell(
                        autofocus: index == 0,
                        focusColor: Colors.transparent,
                        onTap: () async {
                          if (enabled) {
                            setState(() => enabled = false);
                            try {
                              await context.read<WallpaperService>().setFromUnsplash(photo);
                            } finally {
                              setState(() => enabled = true);
                            }
                          }
                        },
                        child: Ink.image(image: NetworkImage(photo.small.toString()), fit: BoxFit.cover),
                      ),
                    ),
                    if (!enabled && Focus.of(context).hasFocus) const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  photo.username,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(decoration: TextDecoration.underline),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );

  ShapeBorder? _cardBorder(bool hasFocus) => hasFocus
      ? RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(4))
      : null;
}
