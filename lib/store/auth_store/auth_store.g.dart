// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

mixin _$AuthStore on _AuthStore, Store {
  late final _$currentPageAtom = Atom(name: '_AuthStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$emailVisibleAtom = Atom(name: '_AuthStore.emailVisible', context: context);

  @override
  bool get emailVisible {
    _$emailVisibleAtom.reportRead();
    return super.emailVisible;
  }

  @override
  set emailVisible(bool value) {
    _$emailVisibleAtom.reportWrite(value, super.emailVisible, () {
      super.emailVisible = value;
    });
  }

  late final _$obscureTextAtom = Atom(name: '_AuthStore.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$currentLoginAtom = Atom(name: '_AuthStore.currentLogin', context: context);

  @override
  bool get currentLogin {
    _$currentLoginAtom.reportRead();
    return super.currentLogin;
  }

  @override
  set currentLogin(bool value) {
    _$currentLoginAtom.reportWrite(value, super.currentLogin, () {
      super.currentLogin = value;
    });
  }

  late final _$currentRegisterAtom = Atom(name: '_AuthStore.currentRegister', context: context);

  @override
  bool get currentRegister {
    _$currentRegisterAtom.reportRead();
    return super.currentRegister;
  }

  @override
  set currentRegister(bool value) {
    _$currentRegisterAtom.reportWrite(value, super.currentRegister, () {
      super.currentRegister = value;
    });
  }

  late final _$usersListAtom = Atom(name: '_AuthStore.usersList', context: context);

  @override
  List<UserModel> get usersList {
    _$usersListAtom.reportRead();
    return super.usersList;
  }

  @override
  set usersList(List<UserModel> value) {
    _$usersListAtom.reportWrite(value, super.usersList, () {
      super.usersList = value;
    });
  }

  late final _$_AuthStoreActionController = ActionController(name: '_AuthStore', context: context);

  @override
  void toggleObscureText() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(name: '_AuthStore.toggleObscureText');
    try {
      return super.toggleObscureText();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPage(int index) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(name: '_AuthStore.setCurrentPage');
    try {
      return super.setCurrentPage(index);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePage(BuildContext context, int index) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(name: '_AuthStore.changePage');
    try {
      return super.changePage(context, index);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
emailVisible: ${emailVisible},
obscureText: ${obscureText},
currentLogin: ${currentLogin},
currentRegister: ${currentRegister},
usersList: ${usersList}
    ''';
  }
}
