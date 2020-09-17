import 'package:api_example/bloc/get_sources_bloc.dart';
import 'package:api_example/elements/error_element.dart';
import 'package:api_example/elements/loader_element.dart';
import 'package:api_example/model/source.dart';
import 'package:api_example/model/source_response.dart';
import 'package:flutter/material.dart';


class TopChannels extends StatefulWidget {
  @override
  _TopChannelsState createState() => _TopChannelsState();
}

class _TopChannelsState extends State<TopChannels> {

  @override
  void initState() {
    super.initState();
    getSourcesBloc..getSources();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SourceResponse>(
      stream: getSourcesBloc.subject.stream,
      builder: (context, AsyncSnapshot<SourceResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildTopChannels(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }
  Widget _buildTopChannels(SourceResponse data){
      List<Source> sources = data.sources;
      if(sources.length == 0){
        return Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text('no sources')
              ],
            ),
        );
      } else {
        return Container(
          height: 115.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sources.length,
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                width: 80.0,
                child: GestureDetector(
                  onTap: (){},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(tag: sources[index].id, child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black12,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: Offset(1.0,1.0)
                            )
                          ],
                          image: DecorationImage(fit: BoxFit.cover,
                                  image: AssetImage("assets/logo/abc-news.png")
                          )
                        ),
                      ),),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(sources[index].name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.4,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0
                      ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(sources[index].category,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 9.0
                      ),)
                    ],
                  ),
                ),
              );
            }
          ),
        );
      }
  }
}
