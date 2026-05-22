.class Lcom/taomee/seer2/n/o;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/l;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/l;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v0}, Lcom/taomee/seer2/n/l;->c(Lcom/taomee/seer2/n/l;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v0}, Lcom/taomee/seer2/n/l;->d(Lcom/taomee/seer2/n/l;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v1}, Lcom/taomee/seer2/n/l;->e(Lcom/taomee/seer2/n/l;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getDesiredMinimumHeight()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v0}, Lcom/taomee/seer2/n/l;->d(Lcom/taomee/seer2/n/l;)Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0xd

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/d/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v1}, Lcom/taomee/seer2/n/l;->f(Lcom/taomee/seer2/n/l;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    iget-object v0, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/l;->a(Lcom/taomee/seer2/n/l;Z)Z

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v0}, Lcom/taomee/seer2/n/l;->e(Lcom/taomee/seer2/n/l;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v0}, Lcom/taomee/seer2/n/l;->d(Lcom/taomee/seer2/n/l;)Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/d/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    invoke-static {v1}, Lcom/taomee/seer2/n/l;->f(Lcom/taomee/seer2/n/l;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    iget-object v0, p0, Lcom/taomee/seer2/n/o;->a:Lcom/taomee/seer2/n/l;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/l;->a(Lcom/taomee/seer2/n/l;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method
