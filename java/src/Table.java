import java.io.File;


public class Table {

	public String name;
	public File indir, targetdir,inDDLFile, ddlFile, inGzipDataFile, inCsvFile, csvFile; 
	
	public boolean ddlParsed=false,tableCreated=false, dataTranslated=false,tableLoaded=false;
	public String ddlParsedError,tableCreatedError, dataTranslatedError,tableLoadedError;
	public boolean ok = true;
	
	public String toString(){
		String NL="\n";
		StringBuffer sb = new StringBuffer();
		sb.append("TABLE [\n- name =").append(name).append(NL).append("- status = ").append((ok?"OK":"ERROR")).append(NL);
		
		if(!ddlParsed)		sb.append("- ddlParsedError = ").append(ddlParsedError).append(NL);
		else {
			if(!tableCreated)		sb.append("- tableCreatedError = ").append(tableCreatedError).append(NL);
			else {
				if(!dataTranslated)		sb.append("- dataTranslatedError = ").append(dataTranslatedError).append(NL);
				else {
					if(!tableLoaded)		sb.append("- tableLoadedError = ").append(tableLoadedError).append(NL);
				}
			}
		}
		sb.append("]");
		return sb.toString();
	}
}

