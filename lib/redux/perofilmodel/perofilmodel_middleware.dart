// import 'package:redux/redux.dart';
// import 'package:plstka_app/redux/action_report.dart';
// import 'package:plstka_app/redux/app/app_state.dart';
// import 'package:plstka_app/redux/perofilmodel/perofilmodel_actions.dart';
// import 'package:plstka_app/data/model/perofilmodel_data.dart';
// import 'package:plstka_app/data/remote/perofilmodel_repository.dart';
// import 'package:plstka_app/redux/perofilmodel/perofilmodel_actions.dart';
// import 'package:plstka_app/data/model/page_data.dart';

// List<Middleware<AppState>> createPerofilModelMiddleware([
//   PerofilModelRepository _repository = const PerofilModelRepository(),
// ]) {
//   final getPerofilModel = _createGetPerofilModel(_repository);
//   final getPerofilModels = _createGetPerofilModels(_repository);
//   final createPerofilModel = _createCreatePerofilModel(_repository);
//   final updatePerofilModel = _createUpdatePerofilModel(_repository);
//   final deletePerofilModel = _createDeletePerofilModel(_repository);

//   return [
//     TypedMiddleware<AppState, GetPerofilModelAction>(getPerofilModel),
//     TypedMiddleware<AppState, GetPerofilModelsAction>(getPerofilModels),
//     TypedMiddleware<AppState, CreatePerofilModelAction>(createPerofilModel),
//     TypedMiddleware<AppState, UpdatePerofilModelAction>(updatePerofilModel),
//     TypedMiddleware<AppState, DeletePerofilModelAction>(deletePerofilModel),
//   ];
// }

// Middleware<AppState> _createGetPerofilModel(
//     PerofilModelRepository repository) {
//   return (Store<AppState> store, dynamic action, NextDispatcher next) {
//     if (checkActionRunning(store, action)) return;
//     if (action.FreeMarker template error (DEBUG mode; use RETHROW in production!):
// The following has evaluated to null or missing:
// ==> clsUNName  [in template "middleware.dart.ftl" at line 60, column 18]

// ----
// Tip: If the failing expression is known to legally refer to something that's sometimes null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
// ----

// ----
// FTL stack trace ("~" means nesting-related):
// 	- Failed at: ${clsUNName}  [in template "middleware.dart.ftl" at line 60, column 16]
// ----

// Java stack trace (for programmers):
// ----
// freemarker.core.InvalidReferenceException: [... Exception message was already printed; see it above ...]
// 	at freemarker.core.InvalidReferenceException.getInstance(InvalidReferenceException.java:134)
// 	at freemarker.core.EvalUtil.coerceModelToTextualCommon(EvalUtil.java:467)
// 	at freemarker.core.EvalUtil.coerceModelToStringOrMarkup(EvalUtil.java:389)
// 	at freemarker.core.EvalUtil.coerceModelToStringOrMarkup(EvalUtil.java:358)
// 	at freemarker.core.DollarVariable.calculateInterpolatedStringOrMarkup(DollarVariable.java:100)
// 	at freemarker.core.DollarVariable.accept(DollarVariable.java:63)
// 	at freemarker.core.Environment.visit(Environment.java:330)
// 	at freemarker.core.Environment.visit(Environment.java:336)
// 	at freemarker.core.Environment.process(Environment.java:309)
// 	at freemarker.template.Template.process(Template.java:384)
// 	at haystack.FlutterReduxGen.mkFile(FlutterReduxGen.java:506)
// 	at haystack.FlutterReduxGen.generateFile(FlutterReduxGen.java:478)
// 	at haystack.FlutterReduxGen.generateRedux(FlutterReduxGen.java:294)
// 	at haystack.FlutterReduxGen.genStructure(FlutterReduxGen.java:286)
// 	at haystack.FlutterReduxGen.checkProjectStructure(FlutterReduxGen.java:201)
// 	at haystack.FlutterReduxGen.onModelsReady(FlutterReduxGen.java:212)
// 	at haystack.ui.ModelTableDialog.onOK(ModelTableDialog.java:127)
// 	at haystack.ui.ModelTableDialog.lambda$init$0(ModelTableDialog.java:77)
// 	at javax.swing.AbstractButton.fireActionPerformed(AbstractButton.java:2022)
// 	at javax.swing.AbstractButton$Handler.actionPerformed(AbstractButton.java:2348)
// 	at javax.swing.DefaultButtonModel.fireActionPerformed(DefaultButtonModel.java:402)
// 	at javax.swing.DefaultButtonModel.setPressed(DefaultButtonModel.java:259)
// 	at javax.swing.plaf.basic.BasicButtonListener.mouseReleased(BasicButtonListener.java:252)
// 	at com.chrisrm.idea.ui.MTButtonUI$ButtonHighlighter.mouseReleased(MTButtonUI.java:383)
// 	at java.awt.Component.processMouseEvent(Component.java:6550)
// 	at javax.swing.JComponent.processMouseEvent(JComponent.java:3325)
// 	at java.awt.Component.processEvent(Component.java:6315)
// 	at java.awt.Container.processEvent(Container.java:2239)
// 	at java.awt.Component.dispatchEventImpl(Component.java:4899)
// 	at java.awt.Container.dispatchEventImpl(Container.java:2297)
// 	at java.awt.Component.dispatchEvent(Component.java:4721)
// 	at java.awt.LightweightDispatcher.retargetMouseEvent(Container.java:4904)
// 	at java.awt.LightweightDispatcher.processMouseEvent(Container.java:4535)
// 	at java.awt.LightweightDispatcher.dispatchEvent(Container.java:4476)
// 	at java.awt.Container.dispatchEventImpl(Container.java:2283)
// 	at java.awt.Window.dispatchEventImpl(Window.java:2746)
// 	at java.awt.Component.dispatchEvent(Component.java:4721)
// 	at java.awt.EventQueue.dispatchEventImpl(EventQueue.java:766)
// 	at java.awt.EventQueue.access$500(EventQueue.java:98)
// 	at java.awt.EventQueue$3.run(EventQueue.java:715)
// 	at java.awt.EventQueue$3.run(EventQueue.java:709)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:74)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:84)
// 	at java.awt.EventQueue$4.run(EventQueue.java:739)
// 	at java.awt.EventQueue$4.run(EventQueue.java:737)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:74)
// 	at java.awt.EventQueue.dispatchEvent(EventQueue.java:736)
// 	at com.intellij.ide.IdeEventQueue.defaultDispatchEvent(IdeEventQueue.java:757)
// 	at com.intellij.ide.IdeEventQueue._dispatchEvent(IdeEventQueue.java:702)
// 	at com.intellij.ide.IdeEventQueue.dispatchEvent(IdeEventQueue.java:375)
// 	at java.awt.EventDispatchThread.pumpOneEventForFilters(EventDispatchThread.java:205)
// 	at java.awt.EventDispatchThread.pumpEventsForFilter(EventDispatchThread.java:116)
// 	at java.awt.EventDispatchThread.pumpEventsForFilter(EventDispatchThread.java:109)
// 	at java.awt.WaitDispatchSupport$2.run(WaitDispatchSupport.java:190)
// 	at java.awt.WaitDispatchSupport$4.run(WaitDispatchSupport.java:235)
// 	at java.awt.WaitDispatchSupport$4.run(WaitDispatchSupport.java:233)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.awt.WaitDispatchSupport.enter(WaitDispatchSupport.java:233)
// 	at java.awt.Dialog.show(Dialog.java:1077)
// 	at java.awt.Component.show(Component.java:1681)
// 	at java.awt.Component.setVisible(Component.java:1633)
// 	at java.awt.Window.setVisible(Window.java:1014)
// 	at java.awt.Dialog.setVisible(Dialog.java:998)
// 	at haystack.FlutterReduxGen.onJsonParsed(FlutterReduxGen.java:185)
// 	at haystack.ui.JSONEditDialog.processJSON(JSONEditDialog.java:325)
// 	at haystack.ui.JSONEditDialog.onOK(JSONEditDialog.java:253)
// 	at haystack.ui.JSONEditDialog.lambda$new$1(JSONEditDialog.java:84)
// 	at javax.swing.AbstractButton.fireActionPerformed(AbstractButton.java:2022)
// 	at javax.swing.AbstractButton$Handler.actionPerformed(AbstractButton.java:2348)
// 	at javax.swing.DefaultButtonModel.fireActionPerformed(DefaultButtonModel.java:402)
// 	at javax.swing.DefaultButtonModel.setPressed(DefaultButtonModel.java:259)
// 	at javax.swing.plaf.basic.BasicButtonListener.mouseReleased(BasicButtonListener.java:252)
// 	at com.chrisrm.idea.ui.MTButtonUI$ButtonHighlighter.mouseReleased(MTButtonUI.java:383)
// 	at java.awt.Component.processMouseEvent(Component.java:6550)
// 	at javax.swing.JComponent.processMouseEvent(JComponent.java:3325)
// 	at java.awt.Component.processEvent(Component.java:6315)
// 	at java.awt.Container.processEvent(Container.java:2239)
// 	at java.awt.Component.dispatchEventImpl(Component.java:4899)
// 	at java.awt.Container.dispatchEventImpl(Container.java:2297)
// 	at java.awt.Component.dispatchEvent(Component.java:4721)
// 	at java.awt.LightweightDispatcher.retargetMouseEvent(Container.java:4904)
// 	at java.awt.LightweightDispatcher.processMouseEvent(Container.java:4535)
// 	at java.awt.LightweightDispatcher.dispatchEvent(Container.java:4476)
// 	at java.awt.Container.dispatchEventImpl(Container.java:2283)
// 	at java.awt.Window.dispatchEventImpl(Window.java:2746)
// 	at java.awt.Component.dispatchEvent(Component.java:4721)
// 	at java.awt.EventQueue.dispatchEventImpl(EventQueue.java:766)
// 	at java.awt.EventQueue.access$500(EventQueue.java:98)
// 	at java.awt.EventQueue$3.run(EventQueue.java:715)
// 	at java.awt.EventQueue$3.run(EventQueue.java:709)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:74)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:84)
// 	at java.awt.EventQueue$4.run(EventQueue.java:739)
// 	at java.awt.EventQueue$4.run(EventQueue.java:737)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:74)
// 	at java.awt.EventQueue.dispatchEvent(EventQueue.java:736)
// 	at com.intellij.ide.IdeEventQueue.defaultDispatchEvent(IdeEventQueue.java:757)
// 	at com.intellij.ide.IdeEventQueue._dispatchEvent(IdeEventQueue.java:702)
// 	at com.intellij.ide.IdeEventQueue.dispatchEvent(IdeEventQueue.java:375)
// 	at java.awt.EventDispatchThread.pumpOneEventForFilters(EventDispatchThread.java:205)
// 	at java.awt.EventDispatchThread.pumpEventsForFilter(EventDispatchThread.java:116)
// 	at java.awt.EventDispatchThread.pumpEventsForFilter(EventDispatchThread.java:109)
// 	at java.awt.WaitDispatchSupport$2.run(WaitDispatchSupport.java:190)
// 	at java.awt.WaitDispatchSupport$4.run(WaitDispatchSupport.java:235)
// 	at java.awt.WaitDispatchSupport$4.run(WaitDispatchSupport.java:233)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.awt.WaitDispatchSupport.enter(WaitDispatchSupport.java:233)
// 	at java.awt.Dialog.show(Dialog.java:1077)
// 	at java.awt.Component.show(Component.java:1681)
// 	at java.awt.Component.setVisible(Component.java:1633)
// 	at java.awt.Window.setVisible(Window.java:1014)
// 	at java.awt.Dialog.setVisible(Dialog.java:998)
// 	at haystack.FlutterReduxGen.actionPerformed(FlutterReduxGen.java:135)
// 	at com.intellij.openapi.actionSystem.ex.ActionUtil$1.run(ActionUtil.java:261)
// 	at com.intellij.openapi.actionSystem.ex.ActionUtil.performActionDumbAware(ActionUtil.java:278)
// 	at com.intellij.openapi.actionSystem.impl.ActionMenuItem$ActionTransmitter.lambda$actionPerformed$0(ActionMenuItem.java:292)
// 	at com.intellij.openapi.wm.impl.FocusManagerImpl.runOnOwnContext(FocusManagerImpl.java:283)
// 	at com.intellij.openapi.wm.impl.IdeFocusManagerImpl.runOnOwnContext(IdeFocusManagerImpl.java:107)
// 	at com.intellij.openapi.actionSystem.impl.ActionMenuItem$ActionTransmitter.actionPerformed(ActionMenuItem.java:282)
// 	at javax.swing.AbstractButton.fireActionPerformed(AbstractButton.java:2022)
// 	at com.intellij.openapi.actionSystem.impl.ActionMenuItem.lambda$fireActionPerformed$0(ActionMenuItem.java:111)
// 	at com.intellij.openapi.application.TransactionGuardImpl.runSyncTransaction(TransactionGuardImpl.java:88)
// 	at com.intellij.openapi.application.TransactionGuardImpl.lambda$submitTransaction$1(TransactionGuardImpl.java:111)
// 	at com.intellij.openapi.application.TransactionGuardImpl.submitTransaction(TransactionGuardImpl.java:120)
// 	at com.intellij.openapi.application.TransactionGuard.submitTransaction(TransactionGuard.java:121)
// 	at com.intellij.openapi.actionSystem.impl.ActionMenuItem.fireActionPerformed(ActionMenuItem.java:111)
// 	at com.intellij.ui.plaf.beg.BegMenuItemUI.doClick(BegMenuItemUI.java:524)
// 	at com.intellij.ui.plaf.beg.BegMenuItemUI.access$300(BegMenuItemUI.java:35)
// 	at com.intellij.ui.plaf.beg.BegMenuItemUI$MyMouseInputHandler.mouseReleased(BegMenuItemUI.java:546)
// 	at java.awt.Component.processMouseEvent(Component.java:6550)
// 	at javax.swing.JComponent.processMouseEvent(JComponent.java:3325)
// 	at java.awt.Component.processEvent(Component.java:6315)
// 	at java.awt.Container.processEvent(Container.java:2239)
// 	at java.awt.Component.dispatchEventImpl(Component.java:4899)
// 	at java.awt.Container.dispatchEventImpl(Container.java:2297)
// 	at java.awt.Component.dispatchEvent(Component.java:4721)
// 	at java.awt.LightweightDispatcher.retargetMouseEvent(Container.java:4904)
// 	at java.awt.LightweightDispatcher.processMouseEvent(Container.java:4535)
// 	at java.awt.LightweightDispatcher.dispatchEvent(Container.java:4476)
// 	at java.awt.Container.dispatchEventImpl(Container.java:2283)
// 	at java.awt.Window.dispatchEventImpl(Window.java:2746)
// 	at java.awt.Component.dispatchEvent(Component.java:4721)
// 	at java.awt.EventQueue.dispatchEventImpl(EventQueue.java:766)
// 	at java.awt.EventQueue.access$500(EventQueue.java:98)
// 	at java.awt.EventQueue$3.run(EventQueue.java:715)
// 	at java.awt.EventQueue$3.run(EventQueue.java:709)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:74)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:84)
// 	at java.awt.EventQueue$4.run(EventQueue.java:739)
// 	at java.awt.EventQueue$4.run(EventQueue.java:737)
// 	at java.security.AccessController.doPrivileged(Native Method)
// 	at java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:74)
// 	at java.awt.EventQueue.dispatchEvent(EventQueue.java:736)
// 	at com.intellij.ide.IdeEventQueue.defaultDispatchEvent(IdeEventQueue.java:757)
// 	at com.intellij.ide.IdeEventQueue._dispatchEvent(IdeEventQueue.java:702)
// 	at com.intellij.ide.IdeEventQueue.dispatchEvent(IdeEventQueue.java:375)
// 	at java.awt.EventDispatchThread.pumpOneEventForFilters(EventDispatchThread.java:205)
// 	at java.awt.EventDispatchThread.pumpEventsForFilter(EventDispatchThread.java:116)
// 	at java.awt.EventDispatchThread.pumpEventsForHierarchy(EventDispatchThread.java:105)
// 	at java.awt.EventDispatchThread.pumpEvents(EventDispatchThread.java:101)
// 	at java.awt.EventDispatchThread.pumpEvents(EventDispatchThread.java:93)
// 	at java.awt.EventDispatchThread.run(EventDispatchThread.java:82)
