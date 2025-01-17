#pragma once

#include <inttypes.h>

class CCamera;
class CStatus;
class RenderParams;
class Scene;

#include <memory>

class IRenderWindow
{
public:
  IRenderWindow();
  virtual ~IRenderWindow();

  virtual void initialize(uint32_t w, uint32_t h, float devicePixelRatio = 1.0f) = 0;
  virtual void render(const CCamera& camera) = 0;
  virtual void resize(uint32_t w, uint32_t h, float devicePixelRatio = 1.0f) = 0;
  virtual void cleanUpResources() {}

  // An interface for reporting statistics and other data updates
  // The IRenderWindow is the first to create this object but it can get shared with other widgets in the gui.
  // Alternative impl could be to create at app layer and pass down into renderers
  virtual std::shared_ptr<CStatus> getStatusInterface() { return nullptr; }

  // I own these.
  virtual RenderParams& renderParams() = 0;

  virtual Scene* scene() = 0;
  virtual void setScene(Scene* s) = 0;
};
