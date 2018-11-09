package;

import haxe.ui.core.*;
import haxe.ui.containers.*;
import haxe.ui.components.*;

@:asserts
class ComponentTest {
	public function new() {}
	
	@:variant(new haxe.ui.containers.HBox())
	@:variant(new haxe.ui.containers.VBox())
	@:variant(new haxe.ui.containers.ScrollView2())
	@:variant(new haxe.ui.containers.TabView2())
	public function getComponentIndex(container:Component) {
		var button1 = new Button();
		var button2 = new Button();
		var button3 = new Button();

		container.addComponent(button1);
		asserts.assert(container.getComponentIndex(button1) == 0);
		container.addComponent(button2);
		asserts.assert(container.getComponentIndex(button1) == 0);
		asserts.assert(container.getComponentIndex(button2) == 1);
		container.addComponentAt(button3, 0);
		asserts.assert(container.getComponentIndex(button1) == 1);
		asserts.assert(container.getComponentIndex(button2) == 2);
		asserts.assert(container.getComponentIndex(button3) == 0);
		
		return asserts.done();
	}
	
	@:variant(new haxe.ui.containers.HBox())
	@:variant(new haxe.ui.containers.VBox())
	@:variant(new haxe.ui.containers.ScrollView2())
	@:variant(new haxe.ui.containers.TabView2())
	public function getComponentAt(container:Component) {
		var button1 = new Button();
		var button2 = new Button();
		var button3 = new Button();

		container.addComponent(button1);
		asserts.assert(container.getComponentAt(0) == button1, 'container.getComponentAt(0) == button1');
		container.addComponent(button2);
		asserts.assert(container.getComponentAt(0) == button1, 'container.getComponentAt(0) == button1');
		asserts.assert(container.getComponentAt(1) == button2, 'container.getComponentAt(1) == button2');
		container.addComponentAt(button3, 0);
		asserts.assert(container.getComponentAt(1) == button1, 'container.getComponentAt(1) == button1');
		asserts.assert(container.getComponentAt(2) == button2, 'container.getComponentAt(2) == button2');
		asserts.assert(container.getComponentAt(0) == button3, 'container.getComponentAt(0) == button3');
		
		return asserts.done();
	}
	
	@:variant(new haxe.ui.containers.HBox())
	@:variant(new haxe.ui.containers.VBox())
	@:variant(new haxe.ui.containers.ScrollView2())
	@:variant(new haxe.ui.containers.TabView2())
	public function setComponentIndex(container:Component) {
		var button1 = new Button();
		var button2 = new Button();
		var button3 = new Button();

		container.addComponent(button1);
		container.addComponent(button2);
		container.addComponent(button3);
		container.setComponentIndex(button3, 0);
		asserts.assert(container.getComponentIndex(button1) == 1);
		asserts.assert(container.getComponentIndex(button2) == 2);
		asserts.assert(container.getComponentIndex(button3) == 0);
		
		return asserts.done();
	}
	
	@:variant(new haxe.ui.containers.HBox())
	@:variant(new haxe.ui.containers.VBox())
	@:variant(new haxe.ui.containers.ScrollView2())
	@:variant(new haxe.ui.containers.TabView2())
	public function numComponents(container:Component) {
		var button1 = new Button();
		var button2 = new Button();
		var button3 = new Button();

		asserts.assert(container.numComponents == 0);
		container.addComponent(button1);
		asserts.assert(container.numComponents == 1);
		container.addComponent(button2);
		asserts.assert(container.numComponents == 2);
		container.addComponent(button3);
		asserts.assert(container.numComponents == 3);
		
		return asserts.done();
	}
	
	@:variant(new haxe.ui.containers.HBox())
	@:variant(new haxe.ui.containers.VBox())
	@:variant(new haxe.ui.containers.ScrollView2())
	@:variant(new haxe.ui.containers.TabView2())
	public function removeComponent(container:Component) {
		var button1 = new Button();
		var button2 = new Button();
		var button3 = new Button();

		container.addComponent(button1);
		container.addComponent(button2);
		container.addComponent(button3);
		container.removeComponent(button2);
		asserts.assert(container.numComponents == 2);
		asserts.assert(container.getComponentIndex(button1) == 0);
		asserts.assert(container.getComponentIndex(button2) == -1);
		asserts.assert(container.getComponentIndex(button3) == 1);
		
		return asserts.done();
	}
}
		
		// for(i in 0...container.numComponents) {
		// 	trace(Type.getClass(container.getComponentAt(i)));
		// }
		// Screen.instance.addComponent(container);
		
		// trace(container.getComponentAt(0) == button3);
		// trace(container.getComponentAt(1) == button1);
		// trace(container.getComponentAt(2) == button2);
		// trace(container.getComponentIndex(button3));
		// trace(container.getComponentIndex(button1));
		// trace(container.getComponentIndex(button2));
		// haxe.Timer.delay(function() {
		// 	container.setComponentIndex(button2, 0);
		// 	trace(container.getComponentAt(0) == button2);
		// 	trace(container.getComponentAt(1) == button3);
		// 	trace(container.getComponentAt(2) == button1);
		// 	trace(container.getComponentIndex(button2));
		// 	trace(container.getComponentIndex(button3));
		// 	trace(container.getComponentIndex(button1));
		// }, 1000);