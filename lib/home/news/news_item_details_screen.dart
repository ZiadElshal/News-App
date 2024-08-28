import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/news_item_details_arguments.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetailsScreen extends StatelessWidget {
  static const String routeName = "news_item_details_screen";

  @override
  Widget build(BuildContext context) {
    var args =
    ModalRoute.of(context)?.settings.arguments as NewsItemDetailsArguments;

    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            "assets/images/main_background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: args.news.urlToImage ?? "",
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryLightColor,
                          )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  /// Author
                  Text(
                    args.news.author ?? "",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.grayLightColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  /// Title
                  Text(args.news.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  /// Date
                  Text(
                    DateFormat.yMd().add_jm().format(
                        DateTime.parse(args.news.publishedAt ?? "")),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.grayLightColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  /// Description
                  Text(args.news.description ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  /// Content
                  Text(args.news.content ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

                  /// URL
                  InkWell(
                    onTap: () async {
                      final url = args.news.url;
                      if (url != null && url.isNotEmpty) {
                        try {
                          final uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          } else {
                            print('Could not launch $url');
                          }
                        } catch (e) {
                          print('Exception while launching URL: $e');
                        }
                      } else {
                        print('Invalid URL');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "View full article ",
                          style:
                          Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.grayColor,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 25,
                          color: AppColors.grayColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
