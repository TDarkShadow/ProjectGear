import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;
import crafttweaker.item.IIngredient;

val craftingToDisable =[
	// Disables default gear recipes
	// These are crafted from Thermal Foundation gears instead
	<crossroads:gear_copper>,
	<crossroads:gear_copshowium>, 
	<crossroads:gear_electrum>,
	<crossroads:gear_gold>, 
	<crossroads:gear_invar>,
	<crossroads:gear_iron>, 
	<crossroads:gear_lead>,
	<crossroads:gear_nickel>, 
	<crossroads:gear_bronze>,
	<crossroads:gear_platinum>, 
	<crossroads:gear_silver>, 
	<crossroads:gear_tin>
] as IItemStack[];
scripts.functions.disableCraftings(craftingToDisable);

// Removes ore dictionary tags from Crossroads gears, preventing UniDict from tampering with them.
<ore:gearCopper>.remove(<crossroads:gear_copper>);
<ore:gearCopshowium>.remove(<crossroads:gear_copshowium>);
<ore:gearElectrum>.remove(<crossroads:gear_electrum>);
<ore:gearGold>.remove(<crossroads:gear_gold>);
<ore:gearInvar>.remove(<crossroads:gear_invar>);
<ore:gearIron>.remove(<crossroads:gear_iron>);
<ore:gearLead>.remove(<crossroads:gear_lead>);
<ore:gearNickel>.remove(<crossroads:gear_nickel>);
<ore:gearBronze>.remove(<crossroads:gear_bronze>);
<ore:gearPlatinum>.remove(<crossroads:gear_platinum>);
<ore:gearSilver>.remove(<crossroads:gear_silver>);
<ore:gearTin>.remove(<crossroads:gear_tin>);

// Craft copshowium gears with machines
mods.immersiveengineering.MetalPress.addRecipe(<crossroads:gear_copshowium>, <ore:ingotCopshowium>, <immersiveengineering:mold:1>, 2400, 4);
mods.tconstruct.Casting.addBasinRecipe(<crossroads:gear_copshowium>, <tconstruct:cast_custom:4>, <liquid:copshowium>, 576, false, 100);



// Craft Crossroads gears with Thermal Foundation gears
// Note: These can be crafted back into Thermal Foundation gears, but those recipes are in thermalfoundation.zs

recipes.addShapeless(<crossroads:gear_copper>, [<ore:gearCopper>]);
recipes.addShapeless(<crossroads:gear_electrum>, [<ore:gearElectrum>]);
recipes.addShapeless(<crossroads:gear_gold>, [<ore:gearGold>]);
recipes.addShapeless(<crossroads:gear_invar>, [<ore:gearInvar>]);
recipes.addShapeless(<crossroads:gear_iron>, [<ore:gearIron>]);
recipes.addShapeless(<crossroads:gear_lead>, [<ore:gearLead>]);
recipes.addShapeless(<crossroads:gear_nickel>, [<ore:gearNickel>]);
recipes.addShapeless(<crossroads:gear_bronze>, [<ore:gearBronze>]);
recipes.addShapeless(<crossroads:gear_platinum>, [<ore:gearPlatinum>]);
recipes.addShapeless(<crossroads:gear_silver>, [<ore:gearSilver>]);
recipes.addShapeless(<crossroads:gear_tin>, [<ore:gearTin>]);





val metals = ["Copper", "Tin", "Bronze", "Iron", "Gold", "Electrum", "Invar", "Nickel", "Copshowium"] as string[];
val redstone = <ore:dustRedstone>;
val ironStick = <ore:stickIron>;

for item in metals {
    val block = oreDict.get(("block" + item) as string);
    val gear = oreDict.get(("gear" + item) as string);
    val cr_gear = itemUtils.getItem("crossroads:gear_" + item);
    val ing_gear = cr_gear | gear;

    recipes.addShaped(itemUtils.getItem("crossroads:large_gear_" + item.toLowerCase),
    [[ing_gear, ing_gear, ing_gear],
    [ing_gear, block, ing_gear],
    [ing_gear, ing_gear, ing_gear]]);

    recipes.addShapeless(itemUtils.getItem("crossroads:toggle_gear_" + item.toLowerCase),
    [redstone,redstone,ironStick,ing_gear]);
}


// Craft large gears using either Thermal Foundation gears or Crossroads gears

/*

val gearcopper = <ore:gearCopper> | <crossroads:gear_copper>;
val gearcopshowium = <ore:gearCopper> | <crossroads:gear_copper>;
val gearelectrum = <ore:gearCopper> | <crossroads:gear_copper>;
val geargold = <ore:gearCopper> | <crossroads:gear_copper>;
val gearinvar = <ore:gearCopper> | <crossroads:gear_copper>;
val geariron = <ore:gearCopper> | <crossroads:gear_copper>;
val gear = <ore:gearCopper> | <crossroads:gear_copper>;
val gear = <ore:gearCopper> | <crossroads:gear_copper>;
val gear = <ore:gearCopper> | <crossroads:gear_copper>;
val gear = <ore:gearCopper> | <crossroads:gear_copper>;
val gear = <ore:gearCopper> | <crossroads:gear_copper>;
val gear = <ore:gearCopper> | <crossroads:gear_copper>;
val gear = <ore:gearCopper> | <crossroads:gear_copper>;

recipes.addShaped(<crossroads:large_gear_copshowium>,
	[[gearcopshowium, gearcopshowium, gearcopshowium],
	 [gearcopshowium, <ore:blockElectrum>, gearcopshowium],
	 [gearcopshowium, gearcopshowium, gearcopshowium]]);
	 
recipes.addShaped(<crossroads:large_gear_electrum>,
	[[gearelectrum, gearelectrum, gearelectrum],
	 [gearelectrum, <ore:blockCopper>, gearelectrum],
	 [gearelectrum, gearelectrum, gearelectrum]]);
	 
recipes.addShaped(<crossroads:large_gear_gold>,
	[[geargold, geargold, geargold],
	 [geargold, <ore:blockCopper>, geargold],
	 [geargold, geargold, geargold]]);
	 
recipes.addShaped(<crossroads:large_gear_copper>,
	[[gearcopper, gearcopper, gearcopper],
	 [gearcopper, <ore:blockCopper>, gearcopper],
	 [gearcopper, gearcopper, gearcopper]]);
	 
recipes.addShaped(<crossroads:large_gear_invar>,
	[[gearinvar, gearinvar, gearinvar],
	 [gearinvar, <ore:blockCopper>, gearinvar],
	 [gearinvar, gearinvar, gearinvar]]);
	 
recipes.addShaped(<crossroads:large_gear_iron>,
	[[geariron, geariron, geariron],
	 [geariron, <ore:blockCopper>, geariron],
	 [geariron, geariron, geariron]]);
	 
recipes.addShaped(<crossroads:large_gear_lead>,
	[[gearlead, gearlead, gearlead],
	 [gearlead, <ore:blockCopper>, gearlead],
	 [gearlead, gearlead, gearlead]]);
	 
recipes.addShaped(<crossroads:large_gear_nickel>,
	[[gearnickel, gearnickel, gearnickel],
	 [gearnickel, <ore:blockCopper>, gearnickel],
	 [gearnickel, gearnickel, gearnickel]]);
	 
recipes.addShaped(<crossroads:large_gear_bronze>,
	[[gearbronze, gearbronze, gearbronze],
	 [gearbronze, <ore:blockCopper>, gearbronze],
	 [gearbronze, gearbronze, gearbronze]]);
	 
recipes.addShaped(<crossroads:large_gear_platinum>,
	[[gearplatinum, gearplatinum, gearplatinum],
	 [gearplatinum, <ore:blockCopper>, gearplatinum],
	 [gearplatinum, gearplatinum, gearplatinum]]);
	 
recipes.addShaped(<crossroads:large_gear_silver>,
	[[gearsilver, gearsilver, gearsilver],
	 [gearsilver, <ore:blockCopper>, gearsilver],
	 [gearsilver, gearsilver, gearsilver]]);
	 
recipes.addShaped(<crossroads:large_gear_tin>,
	[[geartin, geartin, geartin],
	 [geartin, <ore:blockCopper>, geartin],
	 [geartin, geartin, geartin]]);
	 
// Craft toggle gears using either Thermal Foundation or Crossroads gears
recipes.addShapeless(<crossroads:toggle_gear_copper>, [<ore:dustRedstone>, <ore:dustRedstone>, <ore:stickIron>, gearcopper]);

*/