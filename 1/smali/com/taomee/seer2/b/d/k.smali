.class Lcom/taomee/seer2/b/d/k;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/b/d/i;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/b/d/i;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/b/d/k;->a:Lcom/taomee/seer2/b/d/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/b/d/k;->a:Lcom/taomee/seer2/b/d/i;

    invoke-static {v0}, Lcom/taomee/seer2/b/d/i;->a(Lcom/taomee/seer2/b/d/i;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/b/d/k;->a:Lcom/taomee/seer2/b/d/i;

    invoke-virtual {v0}, Lcom/taomee/seer2/b/d/i;->a()V

    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
