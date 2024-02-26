package com.best.kgw.dao;

import java.util.List;
import java.util.Map;

public interface DocumentDao {
    List<Map<String ,Object>> DocumentList(Map<String, Object> dMap);
}
