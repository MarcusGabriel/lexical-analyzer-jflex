package br.com.compiladores.portugol;

import java.io.File;
import java.nio.file.Paths;

public class Generator {

	public static void main(String[] args) {
		String rootPath = Paths.get("").toAbsolutePath(). toString();
		String subPath = "/src/br/com/compiladores/portugol/";
		String fileName = "language.lex";
		String file = rootPath + subPath + fileName;
		File sourceCode = new File(file);
		jflex.Main.generate(sourceCode);
	}
}
