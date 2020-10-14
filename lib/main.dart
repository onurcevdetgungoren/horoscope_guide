import 'package:burc_projem/burc_detay.dart';
import 'package:burc_projem/burc_liste.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  //main fonksiyonumuz içerisine aşağıdaki MyApp widgetımız çağırdık ve çalıştır dediik
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/burcListesi",
      //Başlangıç sayfamızı belirttik, artık home: altında bir widget ile sayfa açmamıza gerek kalmadı
      routes: {
        //Burada map içerisinde kullanacağımız rotaları stringe çevirip, pushnamed ile kullanabileceğiz.
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        //Burada BurcListesinden BurcDetay sayfasına geçerken kullandığımız rotada index bilgilerini
        // iletmesi için gerekli kodu oluşturacağız
        List<String> pathElemanlari = settings.name.split("/"); // / burcDetay / 1    biçiminde rotayı böldük.
        if(pathElemanlari[1] == "burcDetay"){
          //Yukarda split ile rotayı bölünde 0. değer boşluk 1.değer: burcDetay, 2. değer: 1 oldu
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },

      debugShowCheckedModeBanner: false,
      //Sağ üstteki debug yazısını kaldırır
      title: "Burç Yorumları",
      theme: ThemeData(primarySwatch: Colors.pink),
      //home: BurcListesi(),
      //initialtoute: kullandığıımız için başlangıç sayfasını orada belirttik, bu kısmı kullanmaya gerek kalmadı
    );
  }
}
