import 'package:flutter/material.dart';
import 'package:hodomojo_assignment/models/component.dart';
import 'package:hodomojo_assignment/models/header.dart';

class HomeScreenDialog extends StatelessWidget {

  Header header;

  HomeScreenDialog({required this.header});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - 150;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            height: height,
            child: Scrollbar(
              // Use list view to show data fetched from the API
              child: ListView(
                shrinkWrap: true,
                children: [
                  // Use stack to put header and header title one upon another
                  Stack(
                    children: [
                      ClipRRect(
                        // borderRadius: const BorderRadius.all(
                        //   Radius.circular(30)
                        // ),
                        child: Image.network(
                          header.coverUrl,
                          height: height,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return const Padding(
                              padding: EdgeInsets.all(10.0,),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: height - 50,
                        left: 25,
                        child: Text(
                          header.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Use list view builder to show list of components with never scrollable physics
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: header.components.length,
                    itemBuilder: (context, index) {
                      Component component = header.components.elementAt(index);
                      // Check type of component, if text then show title and desc else show image.
                      if (component.type == 'text') {
                        return Container(
                          color: Colors.yellow.shade200,
                          child: ListTile(
                            title: Text(
                              component.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              component.desc,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      } else {
                        // Type is image, so, show only image.
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20)
                            ),
                            child: Image.network(
                              component.url,
                              height: height / 4,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }

                                return const Padding(
                                  padding: EdgeInsets.all(10.0,),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
