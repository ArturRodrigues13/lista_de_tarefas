import 'package:flutter/material.dart';
import 'package:listadetarefas/util/theme_settings.dart';

class Themes extends StatelessWidget {
  const Themes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeSettings.primaryColor,
        title: Text("OPÇÕES"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
      ),
      backgroundColor: ThemeSettings.lightColor,
      body: ListView.builder(
        itemCount: ThemeSettings.colorOptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text([
              "Padrão",
              "Rosa",
              "Vermelho",
              "Azul",
              "Verde",
              "Roxo",
              "Laranja",
              "Verde-água"
            ][index]),
            trailing: Icon(
              Icons.color_lens,
              color: ThemeSettings.colorOptions[index][0],
            ),
            onTap: () {
              ThemeSettings.saveThemeColor(index);
            },
          );
        },
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.edit,
                size: 48
              )
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("I N Í C I O"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context,"/homepage");
              }
            ),

            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text("T E M A S"),
              onTap: () {
                Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }
}
