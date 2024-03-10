import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/extensions/screen_handler.dart';
import 'package:api_lab/view/admin/bloc/admin_bloc.dart';
import 'package:api_lab/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryIdController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Admin",
          style:
              TextStyle(color: text, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TabBar(
                unselectedLabelStyle: TextStyle(color: text.withOpacity(.5)),
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                indicatorColor: cold,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: text,
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: cold,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
                labelPadding: EdgeInsets.symmetric(horizontal: 32),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    text: "User",
                  ),
                  Tab(
                    text: "Prodects",
                  ),
                  Tab(
                    text: "Category",
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: SizedBox(
                  width: context.getWidth(),
                  height: context.getHeight() * 0.75,
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: searchController,
                              onEditingComplete: () {
                                context.read<AdminBloc>().add(AdminSearchEvent(
                                    search: searchController.text));
                                context.read<AdminBloc>().add(AdminLoadEvent());
                              },
                              decoration: InputDecoration(
                                  fillColor: light,
                                  filled: true,
                                  label: Text(
                                    "Search",
                                    style: TextStyle(color: darkblue),
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide.none),
                                  hintText: "Enter Your Search"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<AdminBloc, AdminState>(
                              builder: (context, state) {
                                if (state is AdminLoadingState) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is AdminLoadState) {
                                  return Table(
                                    border: TableBorder.all(
                                        color: text.withOpacity(0.5)),
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                            color: cold,
                                            border: Border.all(
                                                color: cold, width: 2)),
                                        children: [
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "ID",
                                                style: TextStyle(color: text),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Name",
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Role",
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Email",
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ...List.generate(
                                        state.users.length,
                                        (index) => TableRow(
                                          children: [
                                            TableCell(
                                              verticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  state.users[index].id
                                                      .toString(),
                                                  style: TextStyle(color: text),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              verticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    state.users[index].name!,
                                                    style:
                                                        TextStyle(color: text)),
                                              ),
                                            ),
                                            TableCell(
                                              verticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    state.users[index].role!,
                                                    style:
                                                        TextStyle(color: text)),
                                              ),
                                            ),
                                            TableCell(
                                              verticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    state.users[index].email!,
                                                    style:
                                                        TextStyle(color: text)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (state is AdminSearchState) {
                                  return Table(
                                    border: TableBorder.all(
                                        color: text.withOpacity(0.5)),
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                            color: cold,
                                            border: Border.all(
                                                color: cold, width: 2)),
                                        children: [
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "ID",
                                                style: TextStyle(color: text),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Name",
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Role",
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Email",
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                state.user.id.toString(),
                                                style: TextStyle(color: text),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(state.user.name!,
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(state.user.role!,
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(state.user.email!,
                                                  style:
                                                      TextStyle(color: text)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: Text(
                                      "No Data",
                                      style: TextStyle(color: text),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      BlocConsumer<AdminBloc, AdminState>(
                        listener: (context, state) {
                          if (state is AdminSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.msg,
                                  style: TextStyle(
                                    color: text,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                backgroundColor: successMsg,
                              ),
                            );
                          } else if (state is AdminErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.msg,
                                  style: TextStyle(
                                    color: text,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                backgroundColor: errorMsg,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Create Product",
                                style: TextStyle(
                                    color: text,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFieldWidget(
                                label: "Title",
                                controller: titleController,
                                icon: Icons.title,
                                isObscure: false,
                              ),
                              TextFieldWidget(
                                label: "description",
                                controller: descriptionController,
                                icon: Icons.description_outlined,
                                isObscure: false,
                              ),
                              TextFieldWidget(
                                label: "category Id",
                                controller: categoryIdController,
                                icon: Icons.info_outlined,
                                isObscure: false,
                              ),
                              TextFieldWidget(
                                label: "Price",
                                controller: priceController,
                                icon: Icons.price_change,
                                isObscure: false,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: light,
                                    maximumSize: const Size(200, 200)),
                                onPressed: () {
                                  context.read<AdminBloc>().add(
                                      AdminCreateProductEvent(
                                          title: titleController.text,
                                          description:
                                              descriptionController.text,
                                          price:
                                              int.parse(priceController.text), categoryId:int.parse(categoryIdController.text)));
                                  context
                                      .read<AdminBloc>()
                                      .add(AdminLoadEvent());
                                },
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: darkblue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      BlocConsumer<AdminBloc, AdminState>(
                        listener: (context, state) {
                          if (state is AdminSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.msg,
                                  style: TextStyle(
                                    color: text,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                backgroundColor: successMsg,
                              ),
                            );
                          } else if (state is AdminErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.msg,
                                  style: TextStyle(
                                    color: text,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                backgroundColor: errorMsg,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Create Category",
                                style: TextStyle(
                                    color: text,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFieldWidget(
                                label: "Category",
                                icon: Icons.category,
                                controller: categoryController,
                                isObscure: false,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: light,
                                    maximumSize: const Size(200, 200)),
                                onPressed: () {
                                  context.read<AdminBloc>().add(
                                      AdminCreateCategoryEvent(
                                          category: categoryController.text));
                                  context
                                      .read<AdminBloc>()
                                      .add(AdminLoadEvent());
                                },
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: darkblue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
