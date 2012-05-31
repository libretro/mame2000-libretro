#include "shared.h"
#include <stdio.h>

const char* get_resource_path(char* file)
{
  static char resource_path[1024];

  sprintf(resource_path, "%s/%s", IMAMEBASEPATH, file);

  return resource_path;
}

const char* get_documents_path(char* file)
{
    static char documents_path[1024];
    sprintf(documents_path, "%s/%s", IMAMEBASEPATH, file);

    return documents_path;
}
