import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  String name = 'Geril Valdo';
  String description =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  bool showName = false;
  bool showFavorite = false;
  bool showDescription = false;
  bool showSquare = false;
  num counter = 0;
  num counterGesture = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tugas 5 Flutter'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            showName ? 'Nama Saya: $name' : 'Nama Saya:',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showName = !showName;
                            });
                          },
                          child: Text('Tampilkan Nama'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showFavorite = !showFavorite;
                            });
                          },
                          icon: Icon(
                            showFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_outlined,
                            color: showFavorite
                                ? Colors.redAccent
                                : Colors.grey.shade400,
                          ),
                        ),
                        Text(showFavorite ? 'Disukai' : ''),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedCrossFade(
                          firstChild: Text(description),
                          secondChild: Text(''),
                          crossFadeState: showDescription
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,

                          duration: Duration(milliseconds: 1000),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showDescription = !showDescription;
                            });
                          },
                          child: Text('Lihat Selengkapnya'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        counter.toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Kotak Disentuh');
                  setState(() {
                    showSquare = !showSquare;
                  });
                },
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text(showSquare ? '' : 'Cetak Kotak')),
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  print('Tahan lama');
                  setState(() {
                    counterGesture += 3;
                  });
                },
                onTap: () {
                  print('Ditekan sekali');
                  setState(() {
                    counterGesture++;
                  });
                },
                onDoubleTap: () {
                  print('Ditekan dua kali');
                  setState(() {
                    counterGesture += 2;
                  });
                },
                child: SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          counterGesture.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
