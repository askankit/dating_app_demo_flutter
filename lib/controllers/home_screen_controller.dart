import 'package:dating_demo_flutter/Utills/helpers/db_repositories/user_repo.dart';
import 'package:dating_demo_flutter/models/user_model.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeScreenController extends GetxController {
  late final SwipableStackController stackController;
  late UserRepository _repository;
  RxList<UserModel> items = RxList();
  RxList<UserModel> localList = RxList();

  @override
  void onInit() {
    stackController = SwipableStackController();
    _repository= UserRepository();
    loadItems();
    super.onInit();
  }
  addDataToLocalDb(UserModel model){
    _repository.createUser(model);
  }

  getLocalData()async{
    localList.clear();
    localList.value = await _repository.getAllUsers();
    localList.refresh();
  }

  loadItems() {
    List<UserModel> newItems = [
      UserModel(
          id: 1,
          name: "Ankit Bisht",
          age: "24",
          image: "https://picsum.photos/200/300",
          location: "15KM",
          title: "Flutter Developer"),
      UserModel(
          id: 2,
          name: "Kiran Yadav",
          age: "24",
          image: "https://loremflickr.com/g/320/240/paris",
          location: "20KM",
          title: "Flutter Developer"),
      UserModel(
          id: 3,
          name: "Vikas Bhardwaj",
          age: "22",
          image: "https://loremflickr.com/320/240/brazil,rio",
          location: "10KM",
          title: "Flutter Developer"),
      UserModel(
          id: 4,
          name: "Puneet Chand",
          age: "21",
          image: "https://loremflickr.com/320/240",
          location: "5KM",
          title: "Flutter Developer"),
      UserModel(
          id: 5,
          name: "Jatin Sharma",
          age: "26",
          image: "https://loremflickr.com/320/240/dog",
          location: "30KM",
          title: "Flutter Developer & Android Developer"),
      UserModel(
          id: 6,
          name: "Alok Dubey",
          age: "27",
          image: "https://loremflickr.com/320/240/brazil,rio",
          location: "45KM",
          title: "Flutter Developer & Node Js Dev"),
      UserModel(
          id: 7,
          name: "Shweta Sharma",
          age: "21",
          image: "https://loremflickr.com/320/240/paris,girl/all",
          location: "100KM",
          title: "Flutter Developer"),
      UserModel(
          id: 8,
          name: "Twinkle",
          age: "21",
          image: "https://loremflickr.com/g/320/240/paris,girl/all",
          location: "150KM",
          title: "Flutter Developer"),
      UserModel(
          id: 9,
          name: "Shakshi Devi",
          age: "22",
          image: "https://loremflickr.com/320/240/paris,girl/all",
          location: "60KM",
          title: "Flutter Developer"),
      UserModel(
          id: 10,
          name: "Pradeep",
          age: "23",
          image: "https://picsum.photos/200/300",
          location: "20KM",
          title: "Flutter Developer"),
      UserModel(
          id: 11,
          name: "Rakesh",
          age: "29",
          image: "https://loremflickr.com/320/240/paris,girl/all",
          location: "22KM",
          title: "Flutter Developer"),
      UserModel(
          id: 12,
          name: "Rohit Sharma",
          age: "28",
          image: "https://loremflickr.com/320/240/brazil,rio",
          location: "200KM",
          title: "Flutter Developer & Android Developer"),
      UserModel(
          id: 13,
          name: "Karan Tukral",
          age: "25",
          image: "https://loremflickr.com/320/240/paris,girl/all",
          location: "300KM",
          title: "Flutter Developer"),
      UserModel(
          id: 14,
          name: "Saurbh Thakur",
          image: "https://loremflickr.com/320/240/brazil,rio",
          age: "24",
          location: "250KM",
          title: "Android Devloper"),

    ];
    items.clear();
    items.refresh();
    items.assignAll(newItems);
    items.refresh();
  }
}
